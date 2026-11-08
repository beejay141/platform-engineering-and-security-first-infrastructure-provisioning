locals {
  app_prefix          = "${var.product}-${var.service}-${var.environment}"
  database_url        = "${var.database_uri_scheme}://${aws_rds_cluster.aurora.master_username}:${random_password.master_password.result}@${aws_rds_cluster.aurora.endpoint}/${var.database_name}"
  database_reader_url = "${var.database_uri_scheme}://${aws_rds_cluster.aurora.master_username}:${random_password.master_password.result}@${aws_rds_cluster.aurora.reader_endpoint}/${var.database_name}"
}

resource "random_password" "master_password" {
  length  = var.password_length
  special = var.password_special_characters
}

resource "aws_db_subnet_group" "main" {
  name       = "${local.app_prefix}-rds-subnet-group"
  subnet_ids = data.terraform_remote_state.networking.outputs.subnets_public

  tags = {
    Name        = "${local.app_prefix}-rds-subnet-group"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_rds_cluster_parameter_group" "main" {
  count       = var.create_parameter_group ? 1 : 0
  name_prefix = "${local.app_prefix}-cluster-parameter-group"
  family      = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_details
    content {
      name         = parameter.value["name"]
      value        = parameter.value["value"]
      apply_method = parameter.value["apply_method"]
    }
  }

  tags = {
    Name        = "${local.app_prefix}-cluster-parameter-group"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_db_parameter_group" "main" {
  count       = var.create_parameter_group ? 1 : 0
  name_prefix = "${local.app_prefix}-rds-parameter-group"
  family      = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_details
    content {
      name         = parameter.value["name"]
      value        = parameter.value["value"]
      apply_method = parameter.value["apply_method"]
    }
  }

  tags = {
    Name        = "${local.app_prefix}-rds-parameter-group"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier              = local.app_prefix
  engine                          = var.engine
  engine_version                  = var.engine_version
  availability_zones              = data.terraform_remote_state.networking.outputs.availability_zones
  database_name                   = var.database_name
  master_username                 = var.database_username
  master_password                 = random_password.master_password.result
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  vpc_security_group_ids          = [aws_security_group.main.id]
  db_subnet_group_name            = aws_db_subnet_group.main.name
  storage_encrypted               = var.storage_encrypted
  apply_immediately               = var.apply_immediately
  db_cluster_parameter_group_name = var.create_parameter_group ? aws_rds_cluster_parameter_group.main.*.id[0] : ""
  skip_final_snapshot             = var.skip_final_snapshot
  deletion_protection             = var.deletion_protection
  snapshot_identifier             = var.create_from_snapshot ? var.snapshot_identifier : ""
  tags = {
    Name        = "${local.app_prefix}-rds-cluster"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count                        = var.instance_count
  identifier                   = join("-", [local.app_prefix, "worker", count.index])
  cluster_identifier           = aws_rds_cluster.aurora.id
  instance_class               = var.instance_class
  engine                       = aws_rds_cluster.aurora.engine
  engine_version               = aws_rds_cluster.aurora.engine_version
  promotion_tier               = count.index + 1
  publicly_accessible          = var.publicly_accessible
  db_subnet_group_name         = aws_db_subnet_group.main.name
  performance_insights_enabled = var.performance_insights_enabled
  db_parameter_group_name      = var.create_parameter_group ? aws_db_parameter_group.main.*.id[0] : ""
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade

  tags = {
    Name        = "${local.app_prefix}-rds-cluster-instance"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_ssm_parameter" "database_url" {
  name      = length(var.ssm_parameter_name) > 0 ? var.ssm_parameter_name : "${replace(local.app_prefix, "-", "_")}_database_url"
  value     = length(var.rds_extra_params) > 0 ? "${local.database_url}?${var.rds_extra_params}" : "${local.database_url}"
  type      = "SecureString"
  overwrite = true

  tags = {
    Name        = "${local.app_prefix}-ssm-parameter"
    Environment = var.environment
    Terraform   = true
  }
}

resource "aws_ssm_parameter" "database_reader_url" {
  count     = length(var.ssm_parameter_name_reader) > 0 ? 1 : 0
  name      = var.ssm_parameter_name_reader
  value     = length(var.rds_extra_params_reader) > 0 ? "${local.database_reader_url}?${var.rds_extra_params_reader}" : "${local.database_reader_url}"
  type      = "SecureString"
  overwrite = true

  tags = {
    Name        = "${local.app_prefix}-ssm-parameter-reader"
    Environment = var.environment
    Terraform   = true
  }
}
