terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.12.0"
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

module "datadog_synthetic_hc" {
  source       = "../../../modules/datadog/synthetic_hc"
  alertchannel = "channel"
  endpoint     = "https://google.com"
  product      = "cbh"
  service      = "google"
  environment  = "development"
}

output "synthetic_monitor_id" {
  value = module.datadog_synthetic_hc.monitor_id
}
