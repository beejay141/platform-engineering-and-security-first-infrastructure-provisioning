module "datadog_slo_monitor" {
  source              = "app.terraform.io/clipboard-staffing/modules/clipboardstaffing//modules/datadog/slo"
  version             = "1.1.0"
  monitor_name        = var.monitor_name
  monitor_description = var.monitor_description
  monitor_enable      = var.monitor_enable
  monitor_threshold = [
    {
      timeframe = "7d"
      target    = 99.9
      warning   = 99.95
    },
    {
      timeframe = "30d"
      target    = 99.9
      warning   = 99.95

    },
    {
      timeframe = "90d"
      target    = 99.9
      warning   = 99.95
  }]
  monitor_ids     = ["66011519"] // Update this to an array of monitor id(s)
  datadog_api_key = var.DD_API_KEY
  datadog_app_key = var.DD_APP_KEY
  service         = var.service
  team            = var.product
  monitor_tags    = ["nerdeveloper"]
}


module "datadog_slo_metric" {
  source             = "app.terraform.io/clipboard-staffing/modules/clipboardstaffing//modules/datadog/slo"
  version            = "1.1.0"
  metric_name        = var.metric_name
  metric_description = var.metric_description
  metric_enable      = var.metric_enable
  metric_threshold = [
    {
      timeframe = "7d"
      target    = 99.9
      warning   = 99.95
    },
    {
      timeframe = "30d"
      target    = 99.9
      warning   = 99.95

    },
    {
      timeframe = "90d"
      target    = 99.9
      warning   = 99.95
  }]
  queries = [{
    numerator   = "sum:trace.express.request.hits{env:production,service:backend-main}.as_count() - sum:trace.express.request.errors{env:production,service:backend-main}.as_count()" // Update this to numerator query your prefer
    denominator = "sum:trace.express.request.hits{env:production,service:backend-main}.as_count()"                                                                                    // Update this to denominator query your prefer
  }]
  datadog_api_key = var.DD_API_KEY
  datadog_app_key = var.DD_APP_KEY
  service         = var.service
  team            = var.product
  metric_tags     = ["nerdeveloper"]
}
