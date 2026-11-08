resource "datadog_synthetics_test" "healthcheck" {
  type    = "api"
  subtype = "http"
  request_definition {
    method  = "GET"
    url     = var.endpoint
    timeout = 60
  }
  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }
  locations = ["aws:us-west-2"]
  options_list {
    tick_every = 300

    retry {
      count    = 2
      interval = 60
    }

    monitor_options {
      renotify_interval = 120
    }
  }
  name    = "Healthcheck on ${var.endpoint}"
  message = "Healthcheck failed on ${var.endpoint} ${var.alertchannel}"
  tags = compact([
    "managed-by:terraform",
    "team:${var.product}",
    "service:${var.service}",
    "env:${var.environment}"
  ])

  status = "live"
}
