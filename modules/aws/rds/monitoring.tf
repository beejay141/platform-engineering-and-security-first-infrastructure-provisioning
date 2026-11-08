locals {
  # You can disable the monitors with the variable monitor_enabled, if you want
  monitors_per_instance = var.monitor_enabled ? flatten([
    for instance in aws_rds_cluster_instance.aurora_instances : [
      for monitor in var.monitors : {
        id              = lower("${instance.identifier}-${replace(monitor.name, " ", "-")}")
        identifier      = instance.identifier
        monitor_message = monitor.message
        monitor_name    = monitor.name
        monitor_query = format(
          monitor.query,
          "environment:${var.environment},dbinstanceidentifier:${instance.identifier}"
        )
        monitor_threshold = monitor.threshold
      }
    ]
  ]) : []
}

module "datadog_service_database_connection_monitor" {
  source = "../../datadog/monitor"
  for_each = {
    for item in local.monitors_per_instance : item.id => item
  }

  # hard-coded
  monitor_type = "query alert"
  monitor_tags = ["kind:rds"]

  # From variables
  monitor_enable = var.monitor_enabled
  service        = var.service
  team           = var.team
  environment    = var.environment

  # From the loop
  monitor_message   = "${var.alertchannel}  {{^is_recovery}} CBH ${var.service} service database, instance ${each.value.identifier} is experiencing ${each.value.monitor_message} {{/is_recovery}} "
  monitor_name      = "DB ${each.value.identifier} ${each.value.monitor_name}"
  monitor_query     = each.value.monitor_query
  monitor_threshold = each.value.monitor_threshold
}
