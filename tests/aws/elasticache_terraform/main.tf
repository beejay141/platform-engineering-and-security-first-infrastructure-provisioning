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
  length  = 5
  special = false
  upper   = false
}

module "redis-module-test-single-node" {
  source               = "../../../modules/aws/elasticache"
  redis_node_type      = "cache.m4.large"
  service              = "test-single-${random_string.random_string.result}"
  ssm_parameter_name   = "/shared/prod-shadow/REDIS_URL-${random_string.random_string.result}"
  workspace            = "prod-shadow"
  engine_version       = "6.x"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
}

module "redis-module-test-cluster" {
  source                  = "../../../modules/aws/elasticache"
  redis_node_type         = "cache.m4.large"
  service                 = "test-cluster-${random_string.random_string.result}"
  ssm_parameter_name      = "/shared/prod-shadow/REDIS_CLUSTER_URL-${random_string.random_string.result}"
  workspace               = "prod-shadow"
  engine_version          = "6.x"
  cluster_mode            = true
  primary_replica_count   = 1
  secondary_replica_count = 2
  parameter_groups = [
    { key : "acl-pubsub-default", value : "allchannels" },
    { key : "cluster-allow-reads-when-down", value : "no" }
  ]
}
