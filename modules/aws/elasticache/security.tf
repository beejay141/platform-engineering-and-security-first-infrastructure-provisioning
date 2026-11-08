
resource "aws_security_group" "redis" {
  name        = "${var.product}-${var.service}-${var.workspace}-redis-sg"
  description = "Allow HTTP and HTTPS from the outside"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.networking.outputs.vpc_cidr]
    description = "Allow connection to redis"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.product}-${var.service}-${var.workspace}-redis-sg"
    Environment = var.workspace
  }
}
