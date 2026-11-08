locals {
  target_groups = [
    "green",
    "blue"
  ]
  # 27 is the length considering 32 max length - [length("-alb") which is 4 chars] - [1 char for the extra dash] = 32 - 5 = 27
  alb_prefix = "${substr(local.service_name, 0, 27 - length(var.environment_shortname))}-${var.environment_shortname}"
}

resource "aws_lb" "main" {
  name                       = "${local.alb_prefix}-alb"
  internal                   = var.is_internal_service
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = var.is_internal_service ? data.terraform_remote_state.networking.outputs.subnets_private : data.terraform_remote_state.networking.outputs.subnets_public
  enable_deletion_protection = var.enable_deletion_protection

  access_logs {
    bucket  = aws_s3_bucket.main.id
    enabled = var.access_logs_enabled
  }

  depends_on = [aws_s3_bucket_policy.alb_logs_policy_document]

  tags = local.tags
}

resource "aws_lb_target_group" "main" {
  count       = length(local.target_groups)
  name        = "${local.alb_prefix}-${substr(element(local.target_groups, count.index), 0, 1)}"
  port        = var.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id
  slow_start  = 60

  health_check {
    interval = var.alb_health_check_interval
    path     = var.health_check_route
    port     = var.container_port
    timeout  = var.alb_health_check_timeout
  }

  tags = local.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.*.arn[0]
  }
  tags = local.tags

  lifecycle {
    ignore_changes = [default_action]
  }
}

resource "aws_lb_listener_certificate" "clipboard_health" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = var.certificate_arn
}

resource "aws_lb_listener_certificate" "clipboard_health_additional_certs" {
  for_each        = toset(var.additional_certificate_arns)
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = each.value
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 90

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.*.arn[0]
  }

  condition {
    host_header {
      values = [var.service_domain]
    }
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [action]
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }

  tags = local.tags
}

resource "aws_route53_record" "elb" {
  zone_id = data.aws_route53_zone.domain.id
  name    = var.service_domain
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = false
  }

  set_identifier = var.dns_is_weighted ? var.dns_weighted_identifier : null
  dynamic "weighted_routing_policy" {
    for_each = var.dns_is_weighted ? [1] : []
    content {
      weight = var.dns_weight
    }
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "${local.alb_prefix}-alblogs"

  force_destroy = true

  tags = local.tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "alblogs"
    status = "Enabled"
    filter {
      and {
        prefix = "alblogs/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
    expiration {
      days = 180
    }
  }
  depends_on = [aws_s3_bucket.main]
}
resource "aws_s3_bucket_acl" "main" {
  depends_on = [aws_s3_bucket.main]
  bucket     = aws_s3_bucket.main.id
  acl        = "log-delivery-write"
}

data "aws_iam_policy_document" "alb_logs_policy_document" {
  depends_on = [aws_s3_bucket.main]
  statement {
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["${data.aws_elb_service_account.main.arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "alb_logs_policy_document" {
  depends_on = [aws_s3_bucket.main]
  bucket     = aws_s3_bucket.main.id
  policy     = data.aws_iam_policy_document.alb_logs_policy_document.json
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket.main]
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}