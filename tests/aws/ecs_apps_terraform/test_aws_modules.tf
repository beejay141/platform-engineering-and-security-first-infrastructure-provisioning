locals {
  workspace = "development"
}

variable "DD_API_KEY" {
  type = string
}

variable "DD_APP_KEY" {
  type = string
}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      version = "~> 4.0.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.12.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "datadog" {
  api_key = var.DD_API_KEY
  app_key = var.DD_APP_KEY
}

data "template_file" "ecs_execution_policy" {
  template = file("${path.module}/policies/ecs-execution-policy.json")
  vars = {
    service_name   = "cbh-backend-main"
    parent_service = "cbh-backend-main"
    region         = "us-west-2"
    environment    = local.workspace
    aws_account_id = "123456788"
  }
}

resource "random_string" "random_string" {
  length  = 16
  special = false
  upper   = false
}

module "services" {
  source    = "../../../modules/aws/ecs-apps"
  workspace = local.workspace
  team      = "slipway"
  # Ensure the service name is always longer than 32 characters
  service                  = "test-${random_string.random_string.result}"
  region                   = "us-west-2"
  service_domain           = "test-${random_string.random_string.result}.development.clipboardhealth.org"
  min_capacity             = 1
  max_capacity             = 1
  health_check_route       = "/health_check"
  environment_shortname    = local.workspace
  task_definition          = templatefile("${path.module}/test_task_definition.json", { prefix = random_string.random_string.result })
  alertchannel             = "@slack-devoce-alerts"
  slo_enabled              = true
  slo_next_js_enabled      = true
  monitor_enabled          = true
  certificate_arn          = "arn:aws:acm:us-west-2:977320448514:certificate/83364a20-0e72-492d-b0a2-1d948d19b302"
  iam_ecs_execution_role   = file("${path.module}/policies/ecs-assume-role.json")
  iam_ecs_execution_policy = file("${path.module}/policies/ecs-execution-policy.json")
  iam_ecs_task_role        = file("${path.module}/policies/ecs-task-assume-role.json")
  iam_ecs_task_policy      = file("${path.module}/policies/ecs-task-policy.json")
}
