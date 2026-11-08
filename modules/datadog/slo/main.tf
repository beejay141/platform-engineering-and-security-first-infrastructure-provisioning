resource "datadog_service_level_objective" "this" {
  count       = var.metric_enable ? 1 : 0
  name        = var.metric_name
  type        = var.metric_kind
  description = var.metric_description

  dynamic "thresholds" {
    for_each = var.metric_threshold
    content {
      timeframe = thresholds.value["timeframe"]
      target    = thresholds.value["target"]
      warning   = thresholds.value["warning"]
    }
  }

  dynamic "query" {
    for_each = var.queries
    content {
      numerator   = query.value["numerator"]
      denominator = query.value["denominator"]
    }
  }
  tags = compact(concat(
    [
      "managed-by:terraform",
      "team:${var.team}",
      "service:${var.team}-${var.service}",
      "env:${var.environment}"
    ], var.metric_tags
  ))
  force_delete = var.metric_force_delete
}

resource "datadog_service_level_objective" "this_monitor" {
  count       = var.monitor_enable ? 1 : 0
  name        = var.monitor_name
  type        = var.monitor_kind
  description = var.monitor_description
  dynamic "thresholds" {
    for_each = var.monitor_threshold
    content {
      timeframe = thresholds.value["timeframe"]
      target    = thresholds.value["target"]
      warning   = thresholds.value["warning"]
    }
  }
  tags = compact(concat(
    [
      "managed-by:terraform",
      "team:${var.team}",
      "service:${var.team}-${var.service}",
      "env:${var.environment}"
    ],
    var.monitor_tags
  ))
  force_delete = var.monitor_force_delete
  monitor_ids  = var.monitor_ids
}
