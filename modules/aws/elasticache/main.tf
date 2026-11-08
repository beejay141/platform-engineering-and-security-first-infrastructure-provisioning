locals {
  replication_cluster_count = var.cluster_mode ? 1 : 0
  single_cluster_count      = var.cluster_mode ? 0 : 1
  app_prefix                = "${var.product}-${var.service}-${var.workspace}"
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${local.app_prefix}-subnet"
  subnet_ids = data.terraform_remote_state.networking.outputs.subnets_private

  tags = {
    Name        = "${local.app_prefix}-subnet"
    Environment = var.workspace
    Team        = var.product
    Service     = var.service
    Terraform   = true
  }
}

resource "aws_elasticache_parameter_group" "elasticache" {
  name   = "${local.app_prefix}-parameter-group"
  family = "redis${var.engine_version}"

  dynamic "parameter" {
    for_each = var.parameter_groups
    content {
      name  = parameter.value.key
      value = parameter.value.value
    }
  }

  tags = {
    Name        = "${local.app_prefix}-parameter-group"
    Environment = var.workspace
    Team        = var.product
    Service     = var.service
    Terraform   = true
  }
}

resource "aws_elasticache_cluster" "redis" {
  count                    = local.single_cluster_count
  cluster_id               = "${local.app_prefix}-${var.engine}"
  engine                   = var.engine
  node_type                = var.redis_node_type
  num_cache_nodes          = var.num_cache_nodes
  parameter_group_name     = coalesce(var.parameter_group_name, aws_elasticache_parameter_group.elasticache.id)
  security_group_ids       = [aws_security_group.redis.id]
  engine_version           = var.engine_version
  port                     = var.port
  subnet_group_name        = aws_elasticache_subnet_group.redis.name
  snapshot_window          = var.redis_snapshot_window
  snapshot_retention_limit = var.redis_snapshot_retain_days

  tags = {
    Name        = "${local.app_prefix}-${var.engine}"
    Environment = var.workspace
    Team        = var.product
    Service     = var.service
    Terraform   = true
  }
}

resource "aws_elasticache_replication_group" "redis" {
  count                       = local.replication_cluster_count
  apply_immediately           = true
  description                 = "${local.app_prefix}-${var.engine}-cluster"
  automatic_failover_enabled  = true
  multi_az_enabled            = true
  preferred_cache_cluster_azs = data.terraform_remote_state.networking.outputs.availability_zones
  engine                      = var.engine
  engine_version              = var.engine_version
  security_group_ids          = [aws_security_group.redis.id]
  node_type                   = var.redis_node_type
  replication_group_id        = local.app_prefix
  num_node_groups             = var.primary_replica_count
  replicas_per_node_group     = var.secondary_replica_count
  parameter_group_name        = coalesce(var.parameter_group_name, aws_elasticache_parameter_group.elasticache.id)
  port                        = var.port
  subnet_group_name           = aws_elasticache_subnet_group.redis.name

  tags = {
    Name        = "${local.app_prefix}-${var.engine}-cluster"
    Environment = var.workspace
    Team        = var.product
    Service     = var.service
    Terraform   = true
  }
}

resource "aws_ssm_parameter" "redis_cluster_url" {
  count     = local.replication_cluster_count
  name      = var.ssm_parameter_name
  value     = "redis://${aws_elasticache_replication_group.redis[count.index].primary_endpoint_address}"
  type      = "SecureString"
  overwrite = false
}

resource "aws_ssm_parameter" "redis_url" {
  count     = local.single_cluster_count
  name      = var.ssm_parameter_name
  value     = "redis://${aws_elasticache_cluster.redis[count.index].cache_nodes[0].address}:${aws_elasticache_cluster.redis[count.index].cache_nodes[0].port}"
  type      = "SecureString"
  overwrite = false
}
