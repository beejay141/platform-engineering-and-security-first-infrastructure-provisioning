locals {
  monitor = {
    slo_error_rate_monitor = {
      name                            = "Service Error Rate"
      message                         = "is experiencing High Error"
      query                           = "sum(%s):sum:trace.express.request.errors{env:${local.workspace},service:${local.service_name}}.as_count() / sum:trace.express.request.hits{env:${local.workspace},service:${local.service_name}}.as_count() > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_5m"
    }
    latency_monitor = {
      name                            = "Service Latency"
      message                         = "is experiencing High Latency"
      query                           = "avg(%s):avg:trace.express.request{env:${local.workspace},service:${local.service_name}} > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_5m"
    }
    slo_next_js_error_rate_monitor = {
      name                            = "(Next Js) Service Error Rate"
      message                         = "is experiencing High Error"
      query                           = "sum(%s):sum:trace.next.request.errors{env:${local.workspace},service:${local.service_name}}.as_count() / sum:trace.next.request.hits{env:${local.workspace},service:${local.service_name}}.as_count() > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_5m"
    }
    latency_next_js_monitor = {
      name                            = "(Next Js) Service Latency"
      message                         = "is experiencing High Latency"
      query                           = "avg(%s):avg:trace.next.request{env:${local.workspace},service:${local.service_name}} > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_5m"
    }
    apdex_monitor = {
      name                            = "Service Appdex Low"
      message                         = "Service is experiencing Low Apdex Score"
      query                           = "avg(%s):avg:trace.express.request.apdex{env:${local.workspace},service:${local.service_name}} < %s"
      monitor_type                    = "metric alert"
      notification_priority           = "low_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_10m"
    }
    p90_latency_monitor = {
      name                            = "Service P90 Latency"
      message                         = "Service is experiencing High P90 Latency "
      query                           = "percentile(%s):p90:trace.express.request{env:${local.workspace},service:${local.service_name}} > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "low_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_10m"
    }
    abnormal_throughput_monitor = {
      name                            = "Service Abnormal ThroughPut Change "
      message                         = "Service is experiencing abnormal change in throughput "
      query                           = "avg(%s):anomalies(sum:trace.express.request.hits{env:${local.workspace},service:${local.service_name}}, 'agile', 3, direction='both', alert_window='last_15m', interval=60, count_default_zero='true') >= %s"
      monitor_type                    = "metric alert"
      notification_priority           = "low_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_4h"
    }
    http_client_latency_monitor = {
      name                            = "HTTP Client Average Latency High"
      message                         = "Service HTTP Client is experiencing High Average Latency"
      query                           = "avg(%s): ( sum:trace.http.request.duration{env:${local.workspace},service:${local.service_name}-http-client}.rollup(sum).fill(zero) / sum:trace.http.request.hits{env:${local.workspace},service:${local.service_name}-http-client} ) > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_10m"
    }
    http_client_post_latency_monitor = {
      name                            = "HTTP Client Average Latency High (POST API)"
      message                         = "Service HTTP Client is experiencing High Average Latency"
      query                           = "avg(%s):(cutoff_max(sum:trace.http.request.duration{env:${local.workspace},service:${local.service_name}-http-client,resource_name:post}.rollup(sum).fill(zero), 100) / sum:trace.http.request.hits{env:${local.workspace},service:${local.service_name}-http-client,resource_name:post}) > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_10m"
    }
    http_client_p90_latency_monitor = {
      name                            = "HTTP Client P90 Latency High"
      message                         = "Service HTTP Client is experiencing High P90 Latency"
      query                           = "percentile(%s):p90:trace.http.request{env:${local.workspace},service:${local.service_name}-http-client} > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_10m"
    }
    http_client_error_rate_monitor = {
      name                            = "HTTP Client High Error Rate"
      message                         = "Service HTTP Client is experiencing High Error Rate"
      query                           = "sum(%s): ( sum:trace.http.request.errors{env:${local.workspace},service:${local.service_name}-http-client}.as_count() / sum:trace.http.request.hits{env:${local.workspace},service:${local.service_name}-http-client}.as_count() ) > %s"
      monitor_type                    = "metric alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_10m"
    }
    http_client_abnormal_throughput_monitor = {
      name                            = "HTTP Client Abnormal ThroughPut Change"
      message                         = "Service HTTP Client has abnormal throughput change"
      query                           = "avg(%s):anomalies(sum:trace.http.request.hits{env:${local.workspace},service:${local.service_name}-http-client}, 'agile', 3, direction='both', alert_window='last_15m', interval=60, count_default_zero='true') >= %s"
      monitor_type                    = "metric alert"
      notification_priority           = "low_notification_channel"
      escalated_notification_priority = "medium_notification_channel"
      rolling_window                  = "last_4h"
    }
    cpu_usage = {
      name                            = "High Average CPU Usage"
      message                         = "Service is experiencing High Average CPU Usage"
      query                           = "avg(%s):avg:ecs.fargate.cpu.percent{env:${local.workspace},service:${local.service_name}} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "high_notification_channel"
      escalated_notification_priority = "critical_notification_channel"
      rolling_window                  = "last_10m"
    }
    cpu_usage_container = {
      name                            = "High Average CPU Usage by ContainerID"
      message                         = "Service is experiencing High Average CPU Usage per container"
      query                           = "avg(%s):avg:ecs.fargate.cpu.percent{env:${local.workspace},service:${local.service_name}} by {container_id} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "high_notification_channel"
      escalated_notification_priority = "critical_notification_channel"
      rolling_window                  = "last_10m"
    }
    memory_usage = {
      name                            = "Memory Usage High by ContainerID"
      message                         = "Service is experiencing High Memory Usage per container"
      query                           = "avg(%s):sum:ecs.fargate.mem.usage{service:${local.service_name},env:${local.workspace}} by {container_id} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "high_notification_channel"
      escalated_notification_priority = "critical_notification_channel"
      rolling_window                  = "last_10m"
    }
    cache_usage = {
      name                            = "Cache Memory Usage High by ContainerID"
      message                         = "Service is experiencing High Cache Memory Usage per container"
      query                           = "avg(%s):sum:ecs.fargate.mem.cache{service:${local.service_name},env:${local.workspace}} by {container_id} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "high_notification_channel"
      escalated_notification_priority = "critical_notification_channel"
      rolling_window                  = "last_10m"
    }
    network_sent = {
      name                            = "High Network Bytes Sent per ContainerID"
      message                         = "Service is experiencing High Network Bytes Sent per container"
      query                           = "avg(%s):sum:ecs.fargate.net.bytes_sent{service:${local.service_name},env:${local.workspace}} by {container_id} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_10m"
    }
    network_recv = {
      name                            = "High Network Bytes Recv per ContainerID"
      message                         = "Service is experiencing High Network Bytes Recv per container"
      query                           = "avg(%s):sum:ecs.fargate.net.bytes_rcvd{service:${local.service_name},env:${local.workspace}} by {container_id} > %s"
      monitor_type                    = "query alert"
      notification_priority           = "medium_notification_channel"
      escalated_notification_priority = "high_notification_channel"
      rolling_window                  = "last_10m"
    }
  }
  monitor_configuration_exclude_null_keys = {
    for key, value in var.monitors_configuration :
    key => {
      for k, v in value :
      k => {
        for k1, v1 in v :
        k1 => v1
        if v1 != null
      }
      if v != null
    }
  }
  casted_monitors_configuration = {
    for key, value in var.monitors :
    key => {
      critical = {
        threshold = value
      }
    }
  }
  monitor_configuration = merge(var.monitors_configuration_enabled ? local.monitor_configuration_exclude_null_keys : {}, var.monitors_configuration_enabled ? {} : local.casted_monitors_configuration)
  alert_channel_regex = {
    opsgenie                      = regexall("(@opsgenie[^\\s]+)", var.alertchannel)
    slack_team_alerts             = regexall("(@slack-team[^\\s]+-alerts)", var.alertchannel)
    slack_prod_environment_alerts = regexall("(@slack-devoce[^\\s]+)", var.alertchannel)
    slack_test_environment        = regexall("(@slack-test-environment[^\\s]+)", var.alertchannel)
    slack_team_non_prod_alerts    = regexall("(@slack-team[^\\s]+-non-prod-alerts)", var.alertchannel)
  }
  alert_channels = {
    opsgenie                      = join(" ", flatten(local.alert_channel_regex.opsgenie))
    slack_team_alerts             = join(" ", flatten(local.alert_channel_regex.slack_team_alerts))
    slack_team_non_prod_alerts    = join(" ", flatten(local.alert_channel_regex.slack_team_non_prod_alerts))
    slack_prod_environment_alerts = join(" ", flatten(local.alert_channel_regex.slack_prod_environment_alerts))
    slack_test_environment        = join(" ", flatten(local.alert_channel_regex.slack_test_environment))
  }
  notification_channel_configuration = {
    non-production = {
      critical_notification_channel = {
        alert    = "${local.alert_channels.slack_test_environment} ${local.alert_channels.slack_team_non_prod_alerts}"
        warn     = "${local.alert_channels.slack_test_environment} ${local.alert_channels.slack_team_non_prod_alerts}"
        recovery = "${local.alert_channels.slack_test_environment} ${local.alert_channels.slack_team_non_prod_alerts}"
      }
      high_notification_channel = {
        alert    = "${local.alert_channels.slack_test_environment} ${local.alert_channels.slack_team_non_prod_alerts}"
        warn     = "${local.alert_channels.slack_test_environment} "
        recovery = "${local.alert_channels.slack_test_environment} "
      }
      medium_notification_channel = {
        alert    = "${local.alert_channels.slack_test_environment}"
        warn     = "${local.alert_channels.slack_test_environment} "
        recovery = "${local.alert_channels.slack_test_environment} "
      }
      low_notification_channel = {
        alert    = "${local.alert_channels.slack_test_environment}"
        warn     = ""
        recovery = ""
      }
      info_notification_channel = {
        alert    = ""
        warn     = ""
        recovery = ""
      }
    }
    production = {
      critical_notification_channel = {
        alert    = "${local.alert_channels.opsgenie} ${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
        warn     = "${local.alert_channels.opsgenie} ${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
        recovery = "${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
      }
      high_notification_channel = {
        alert    = "${local.alert_channels.opsgenie} ${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
        warn     = "${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
        recovery = "${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
      }
      medium_notification_channel = {
        alert    = "${local.alert_channels.slack_team_alerts} ${local.alert_channels.slack_prod_environment_alerts}"
        warn     = "${local.alert_channels.slack_prod_environment_alerts}"
        recovery = "${local.alert_channels.slack_prod_environment_alerts}"
      }
      low_notification_channel = {
        alert    = "${local.alert_channels.slack_prod_environment_alerts}"
        warn     = ""
        recovery = "${local.alert_channels.slack_prod_environment_alerts}"
      }
      info_notification_channel = {
        alert    = "${local.alert_channels.slack_prod_environment_alerts}"
        warn     = ""
        recovery = ""
      }
    }
  }
  notification_channel = local.workspace == "production" ? local.notification_channel_configuration.production : local.notification_channel_configuration.non-production
}

module "datadog_monitor" {
  source                     = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/monitor"
  for_each                   = { for key, value in local.monitor : key => value if contains(keys(local.monitor_configuration), key) }
  version                    = "5.1.3"
  monitor_message            = <<-EOT
  {{#is_alert}} Alert ${try(local.monitor_configuration[each.key]["critical"]["alert_channel"], local.notification_channel[each.value.notification_priority]["alert"])} ${local.service_name} ${each.value.message} {{/is_alert}}
  {{#is_warning}} Warning ${try(local.monitor_configuration[each.key]["warn"]["alert_channel"], local.notification_channel[each.value.notification_priority]["warn"])} ${local.service_name} ${each.value.message} {{/is_warning}}
  {{#is_recovery}} ${try(local.monitor_configuration[each.key]["recovery"]["recovery_channel"], local.notification_channel[each.value.notification_priority]["recovery"])} ${local.service_name} ${each.value.message} has recovered Successfully {{/is_recovery}}
                               EOT
  monitor_escalation_message = <<-EOT
  {{#is_renotify}}
    {{#is_alert}} Alert Escalated ${try(local.monitor_configuration[each.key]["critical"]["escalated_channel"], local.notification_channel[each.value.escalated_notification_priority]["alert"])} ${local.service_name} ${each.value.message} {{/is_alert}}
    {{#is_warning}} Warning Escalated ${try(local.monitor_configuration[each.key]["warn"]["escalated_channel"], local.notification_channel[each.value.escalated_notification_priority]["warn"])} ${local.service_name} ${each.value.message} {{/is_warning}}
    {{#is_recovery}} ${try(local.monitor_configuration[each.key]["recovery"]["recovery_channel"], local.notification_channel[each.value.escalated_notification_priority]["recovery"])} ${local.service_name} ${each.value.message} has recovered Successfully {{/is_recovery}}
  {{/is_renotify}}
                              EOT
  monitor_name               = "${local.app_prefix}-monitor [${each.value.name}]"
  monitor_query              = try(local.monitor_configuration[each.key]["custom"]["custom_query"], format(each.value.query, try(local.monitor_configuration[each.key]["custom"]["rolling_window"], each.value.rolling_window), local.monitor_configuration[each.key]["critical"]["threshold"]))
  monitor_tags               = ["SLO"]
  service                    = local.service_name
  team                       = var.team
  monitor_enable             = var.monitor_enabled
  monitor_threshold = [{
    warning           = try(local.monitor_configuration[each.key]["warn"]["threshold"], null)
    warning_recovery  = try(local.monitor_configuration[each.key]["warn"]["recovery_threshold"], null)
    critical          = local.monitor_configuration[each.key]["critical"]["threshold"]
    critical_recovery = try(local.monitor_configuration[each.key]["critical"]["recovery_threshold"], null)
  }]
  monitor_type = each.value.monitor_type
  environment  = local.workspace
}

module "datadog_synthetic_hc" {
  count = var.is_internal_service ? 0 : 1

  source       = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/datadog/synthetic_hc"
  version      = "3.1.1"
  alertchannel = var.alertchannel
  endpoint     = local.endpoint
  product      = local.product
  service      = local.service_name
  environment  = var.workspace
}
