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

module "datadog_monitor" {
  source          = "../../../modules/datadog/monitor"
  monitor_message = "Monitor triggered. Notify: @hipchat-channel"
  monitor_name    = "terratest-monitor"
  monitor_query   = "avg(last_1h):sum:system.net.bytes_rcvd{host:host0} > 100"
  monitor_tags    = ["foo:bar"]
  team            = "kraken"
  service         = "test-service"
  environment     = "development"
}
