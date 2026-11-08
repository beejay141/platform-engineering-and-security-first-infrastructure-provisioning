module "datadog_slo_error_rate" {
  source             = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count              = var.slo_enabled ? 1 : 0
  version            = "3.1.1"
  metric_name        = "${local.app_prefix}-slo [High error rate]"
  metric_description = "SLO Configuration for ${local.service_name}"
  metric_enable      = var.slo_enabled

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
    }
  ]
  queries = [
    {
      numerator   = "sum:trace.express.request.hits{env:${var.workspace},service:${local.service_name}}.as_count() - sum:trace.express.request.errors{env:${var.workspace},service:${local.service_name}}.as_count()"
      denominator = "sum:trace.express.request.hits{env:${var.workspace},service:${local.service_name}}.as_count()"
    }
  ]
  service     = var.service
  team        = var.team
  environment = var.workspace
}

module "datadog_slo_monitor_latency" {
  source              = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count               = var.slo_enabled ? 1 : 0
  version             = "3.1.1"
  monitor_name        = "${local.app_prefix}-slo [HTTP Latency]"
  monitor_description = "SLO Monitor Configuration for ${local.service_name}"
  monitor_enable      = var.slo_enabled
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
  monitor_ids = [module.datadog_monitor["latency_monitor"].datadog_monitor_id]
  service     = var.service
  team        = var.team
  environment = var.workspace
}

module "datadog_slo_synthetic_hc" {
  source              = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count               = var.slo_enabled ? (var.is_internal_service ? 0 : 1) : 0
  version             = "3.1.1"
  monitor_name        = "${local.endpoint} [Healthcheck]"
  monitor_description = "Healthcheck on ${local.endpoint}"
  monitor_enable      = var.slo_enabled
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
  monitor_ids = var.is_internal_service ? [] : [module.datadog_synthetic_hc.monitor_id]
  service     = var.service
  team        = var.team
  environment = var.workspace
}

module "datadog_slo_next_js_error_rate" {
  source             = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count              = var.slo_next_js_enabled ? 1 : 0
  version            = "3.1.1"
  metric_name        = "${local.app_prefix}-slo [High error rate]"
  metric_description = "SLO Configuration for ${local.service_name}"
  metric_enable      = var.slo_next_js_enabled

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
    }
  ]
  queries = [
    {
      numerator   = "sum:trace.next.request.hits{env:${var.workspace},service:${local.service_name}}.as_count() - sum:trace.next.request.errors{env:${var.workspace},service:${local.service_name}}.as_count()"
      denominator = "sum:trace.next.request.hits{env:${var.workspace},service:${local.service_name}}.as_count()"
    }
  ]
  service     = var.service
  team        = var.team
  environment = var.workspace

}
module "datadog_slo_next_js_monitor_latency" {
  source              = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count               = var.slo_next_js_enabled ? 1 : 0
  version             = "3.1.1"
  monitor_name        = "${local.app_prefix}-slo [HTTP Latency]"
  monitor_description = "SLO Monitor Configuration for ${local.service_name}"
  monitor_enable      = var.slo_next_js_enabled
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
  monitor_ids = [module.datadog_monitor["latency_next_js_monitor"].datadog_monitor_id]
  service     = var.service
  team        = var.team
  environment = var.workspace
}
module "datadog_slo_next_js_synthetic_hc" {
  source              = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/slo"
  count               = var.slo_next_js_enabled ? (var.is_internal_service ? 0 : 1) : 0
  version             = "3.1.1"
  monitor_name        = "${local.endpoint} [Healthcheck]"
  monitor_description = "Healthcheck on ${local.endpoint}"
  monitor_enable      = var.slo_next_js_enabled
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
  monitor_ids = var.is_internal_service ? [] : [module.datadog_synthetic_hc.monitor_id]
  service     = var.service
  team        = var.team
  environment = var.workspace
}
