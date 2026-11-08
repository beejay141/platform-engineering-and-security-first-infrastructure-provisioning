resource "aws_codedeploy_app" "main" {
  compute_platform = "ECS"
  name             = local.app_prefix
}

resource "aws_codedeploy_deployment_group" "main" {
  app_name               = aws_codedeploy_app.main.name
  deployment_config_name = var.codedeploy_deployment_config
  deployment_group_name  = "${local.app_prefix}-deploymentgroup"
  service_role_arn       = format("arn:aws:iam::%s:role/ecsCodeDeployRole", data.aws_caller_identity.current.account_id)

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "CONTINUE_DEPLOYMENT"
    }

    terminate_blue_instances_on_deployment_success {
      action                           = "TERMINATE"
      termination_wait_time_in_minutes = var.codedeploy_blue_termination_wait_time_in_minutes
    }
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  load_balancer_info {
    target_group_pair_info {
      prod_traffic_route {
        listener_arns = [aws_lb_listener.https.arn]
      }

      target_group {
        name = aws_lb_target_group.main.*.name[0]
      }

      target_group {
        name = aws_lb_target_group.main.*.name[1]
      }
    }
  }

  ecs_service {
    cluster_name = "${local.product}-${local.workspace}-cluster"
    service_name = local.app_prefix
  }

  depends_on = [
    aws_ecs_service.main
  ]
}
