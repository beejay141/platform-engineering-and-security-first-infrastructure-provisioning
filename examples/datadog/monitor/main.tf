
module "datadog_monitor" {
  source          = "app.terraform.io/clipboard-staffing/modules/clipboardstaffing//modules/datadog/monitor"
  version         = "1.1.0"
  datadog_api_key = var.DD_API_KEY
  datadog_app_key = var.DD_APP_KEY
  monitor_message = "@slack-devoce-alerts"
  monitor_name    = "DataDog Alerts for Example Slack Channel"
  monitor_query   = "avg(last_5m):avg:aws.applicationelb.target_response_time.p50{name:cbh-chat-production-alb} > 0.1"
  monitor_tags    = ["nerdeveloper", "slack-device-alerts"]
}
