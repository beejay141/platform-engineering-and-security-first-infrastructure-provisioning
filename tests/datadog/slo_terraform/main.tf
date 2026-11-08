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

module "datadog_slo_metric" {
  source             = "../../../modules/datadog/slo"
  metric_name        = "Test app metric"
  metric_enable      = "true"
  metric_description = "This app contains nodejs SLO"
  metric_threshold = [
    {
      timeframe = "7d"
      warning   = "99.95"
      target    = "99.9"
    }
  ]
  team        = "kraken"
  service     = "Test service"
  metric_tags = ["foo:bar"]
  environment = "development"
}

module "datadog_slo_monitor" {
  source              = "../../../modules/datadog/slo"
  monitor_name        = "Test monitor"
  monitor_enable      = "true"
  monitor_description = "This app contains nodejs SLO"
  monitor_threshold = [
    {
      timeframe = "7d"
      warning   = "99.95"
      target    = "99.9"
    }
  ]
  team    = "kraken"
  service = "Test service"
  monitor_tags = [
  "foo:bar"]
  monitor_ids = ["60086740"]
  environment = "development"
}
