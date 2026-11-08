locals {
  tags = merge(var.tags,
    {
      terraform-module = "terraform-clipboardstaffing-modules/kinesis",
      Terraform        = true
      Environment      = var.environment
    }
  )
}

resource "aws_kinesis_stream" "streams" {
  name             = "${var.product}-${var.service}-${var.stream_name}-${var.environment}"
  shard_count      = var.shard_count
  retention_period = var.stream_retention_period
  tags             = local.tags
}
