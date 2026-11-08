resource "aws_security_group" "main" {
  name        = "${local.app_prefix}-rds-security-group"
  description = "Allow ${local.app_prefix} ports within the VPC, and browsing from the outside"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port   = var.database_port
    to_port     = var.database_port
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.networking.outputs.vpc_cidr]
    description = "Allow connection within vpc"
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_cidrs)
    content {
      from_port   = var.database_port
      to_port     = var.database_port
      protocol    = "tcp"
      cidr_blocks = [each.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outside"
  }

  tags = {
    Name        = "${local.app_prefix}-rds-security-group"
    Environment = var.environment
    Terraform   = true
  }
}
