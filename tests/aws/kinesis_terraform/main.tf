terraform {
  required_providers {
    aws = {
      version = "~> 4.2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "random_string" "random_string" {
  length  = 16
  special = false
  upper   = false
}

module "kinesis_stream" {
  source                  = "../../../modules/aws/kinesis"
  shard_count             = 48
  stream_retention_period = 48
  service                 = "test-${random_string.random_string.result}"
  environment             = "development"
  tags                    = { "module" : "kinesis" }
  stream_name             = "test"
}
