terraform {
  required_providers {
    aws = {
      version = "~> 4.2.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.18.0"
    }
  }
}

variable "DD_API_KEY" {
  type = string
}

variable "DD_APP_KEY" {
  type = string
}

provider "datadog" {
  api_key = var.DD_API_KEY
  app_key = var.DD_APP_KEY
}

resource "random_string" "random_string" {
  length  = 16
  special = false
  upper   = false
}

module "rds-module-test" {
  source                       = "../../../modules/aws/rds"
  engine                       = "aurora-postgresql"
  database_port                = "5432"
  environment                  = "development"
  service                      = "rds-module-test-${random_string.random_string.result}"
  team                         = "slipway"
  database_uri_scheme          = "postgres"
  database_name                = "postgres"
  database_username            = "postgres"
  engine_version               = "13.7"
  instance_class               = "db.t3.medium"
  instance_count               = 2
  networking_environment       = "development"
  monitor_enabled              = false
  storage_encrypted            = false
  deletion_protection          = false
  performance_insights_enabled = false
  alertchannel                 = "test"
  ssm_parameter_name           = "/terraform-clipboardstaffing-modules/rds/test_db_url"
  parameter_group_family       = "aurora-postgresql13"
}
