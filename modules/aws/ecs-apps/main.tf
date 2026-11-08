locals {
  workspace       = var.workspace
  task_definition = var.create_task_definition ? jsondecode(var.task_definition) : null
  product         = "cbh"
  service_name    = "${local.product}-${var.service}"
  app_prefix      = "${local.service_name}-${var.workspace}"
  endpoint        = "https://${aws_route53_record.elb.name}${var.health_check_route}"
  tags            = { TerraformModule = "ecs-apps" }
}

resource "aws_security_group" "main" {
  name        = "${local.app_prefix}-sg"
  description = "Allow ${local.app_prefix} ports within the VPC, and browsing from the outside"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port = var.container_port
    to_port   = var.container_port
    protocol  = "tcp"
    cidr_blocks = [
    data.terraform_remote_state.networking.outputs.vpc_cidr]
    description = "Allow connection to Service Port"
  }

  ingress {
    from_port = var.datadog_agent_port
    to_port   = var.datadog_agent_port
    protocol  = "tcp"
    cidr_blocks = [
    data.terraform_remote_state.networking.outputs.vpc_cidr]
    description = "Allow connection to Datadog Agent Port"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
    description = "Allow all outside"
  }

  tags = local.tags
}

resource "aws_security_group" "alb" {
  name        = "${local.app_prefix}-alb-sg"
  description = "Allow HTTP and HTTPS from the outside"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
    description = "Allow HTTP to ALB"
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
    description = "Allow HTTPS to ALB"
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_iam_role" "ecs_execution_role" {
  # 54 is calculated as 64 - [length of "-ecs-role" + 1 which is 10]
  name               = "${substr(local.service_name, 0, 54 - length(local.workspace))}-${local.workspace}-ecs-role"
  assume_role_policy = var.iam_ecs_execution_role

  tags = local.tags
}

resource "aws_iam_role_policy" "ecs_execution_policy" {
  name   = "${local.app_prefix}-execution-policy"
  policy = var.iam_ecs_execution_policy
  role   = aws_iam_role.ecs_execution_role.id
}

resource "aws_iam_role" "ecs_task_role" {
  # 53 is calculated as 64 - [length of "-task-role" + 1 which is 11]
  name               = "${substr(local.service_name, 0, 53 - length(local.workspace))}-${local.workspace}-task-role"
  assume_role_policy = var.iam_ecs_task_role

  tags = local.tags
}

resource "aws_iam_role_policy" "ecs_task_policy" {
  name   = "${local.app_prefix}-task-policy"
  policy = var.iam_ecs_task_policy
  role   = aws_iam_role.ecs_task_role.id
}


resource "aws_ecs_task_definition" "main" {
  family                   = local.app_prefix
  count                    = var.create_task_definition ? 1 : 0
  network_mode             = lookup(local.task_definition, "networkMode")
  requires_compatibilities = lookup(local.task_definition, "requiresCompatibilities")
  cpu                      = lookup(local.task_definition, "cpu")
  memory                   = lookup(local.task_definition, "memory")
  container_definitions    = jsonencode(lookup(local.task_definition, "containerDefinitions"))
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  tags = local.tags
}

resource "aws_ecs_service" "main" {
  name          = local.app_prefix
  cluster       = "${local.product}-${var.ecs_cluster_workspace != "" ? var.ecs_cluster_workspace : var.workspace}-cluster"
  desired_count = var.min_capacity

  health_check_grace_period_seconds = var.health_check_grace_period_seconds

  network_configuration {
    subnets = data.terraform_remote_state.networking.outputs.subnets_private
    security_groups = [
    aws_security_group.main.id]
    assign_public_ip = false
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }

  platform_version       = var.ecs_platform_version
  scheduling_strategy    = var.ecs_scheduling_strategy
  enable_execute_command = var.enable_execute_command

  task_definition = var.create_task_definition ? "${aws_ecs_task_definition.main[0].family}:${aws_ecs_task_definition.main[0].revision}" : null

  load_balancer {
    target_group_arn = aws_lb_target_group.main.*.arn[0]
    container_name   = var.container_name == null ? local.service_name : var.container_name
    container_port   = var.container_port
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  lifecycle {
    ignore_changes = [
      desired_count,
      load_balancer,
      task_definition,
      capacity_provider_strategy,
      health_check_grace_period_seconds,
      propagate_tags,
      service_registries
    ]
  }

  tags = local.tags
}

resource "aws_appautoscaling_target" "main" {
  service_namespace  = "ecs"
  resource_id        = "service/${aws_ecs_service.main.cluster}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  role_arn           = format("arn:aws:iam::%s:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService", data.aws_caller_identity.current.account_id)
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
  lifecycle {
    ignore_changes = [
      role_arn
    ]
  }
}

resource "aws_appautoscaling_policy" "cpu" {
  count              = 1
  name               = "ecs_scale_cpu"
  resource_id        = aws_appautoscaling_target.main.resource_id
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main.service_namespace
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.target_autoscaling_cpu
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }

  depends_on = [
  aws_appautoscaling_target.main]
}

resource "aws_appautoscaling_policy" "memory" {
  count              = 1
  name               = "ecs_scale_memory"
  resource_id        = aws_appautoscaling_target.main.resource_id
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension
  service_namespace  = aws_appautoscaling_target.main.service_namespace
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.target_autoscaling_memory
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }

  depends_on = [
    aws_appautoscaling_target.main
  ]
}
