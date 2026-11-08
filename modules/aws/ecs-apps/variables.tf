variable "workspace" {
  type = string
  validation {
    condition     = length(var.workspace) > 0
    error_message = "Variable 'workspace' must be provided."
  }
}

variable "service" {
  type = string
  validation {
    condition     = length(var.service) > 0
    error_message = "Variable 'service' must be provided."
  }
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "ecs_platform_version" {
  type    = string
  default = "1.4.0"
}

variable "ecs_scheduling_strategy" {
  type    = string
  default = "REPLICA"
}

variable "container_name" {
  description = "The name of the container that will receive the requests from the task load balancer. If not provided, will be <product>-<service_name>."
  type        = string
  default     = null
}

variable "container_port" {
  description = "The port of the container that will receive the requests from the task load balancer."
  type        = number
  default     = 80
  validation {
    condition     = var.container_port >= 0 && var.container_port <= 65536
    error_message = "You must set a valid port, between 0 and 65536."
  }
}

variable "datadog_agent_port" {
  type    = number
  default = 8126
}

variable "enable_execute_command" {
  type    = bool
  default = true
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 2
}

variable "target_autoscaling_cpu" {
  type    = number
  default = 50
}

variable "target_autoscaling_memory" {
  type    = number
  default = 50
}

variable "create_task_definition" {
  type        = bool
  description = "Manage the task definition through terraform?"
  default     = true
}

variable "task_definition" {
  type        = string
  description = "The task definition to use for the service. This variable is mandatory if var.create_task_definition is true."
  default     = null
}

variable "health_check_grace_period_seconds" {
  type    = number
  default = 0
}

variable "slo_enabled" {
  type    = bool
  default = false
}

variable "slo_next_js_enabled" {
  type    = bool
  default = false
}

variable "monitor_enabled" {
  type    = bool
  default = false
}

variable "alertchannel" {
  type = string
  validation {
    condition     = length(var.alertchannel) > 0
    error_message = "Variable 'alertchannel' must be provided."
  }
}

variable "monitors_configuration" {
  description = <<EOF
  Each monitor has the following configurations
  a) critical: A required block that defines the critical threshold and alerting channel for the monitor. It includes the following parameters:
    1) threshold:
        A required parameter that specifies the threshold value above which an alert will be triggered.
    2) recovery_threshold:
        An optional parameter that specifies the recovery threshold value for the monitor.
        If the monitor triggers an alert and the metric value goes below this value,
        the alert will be automatically resolved. If not specified, the recovery threshold defaults to null.
    3) alert_channel:
        An optional parameter that specifies the notification channel for the alert.
        If not specified, the monitor will use the standard channel for alerts.
    4) escalated_channel:
        An optional parameter that specifies the notification channel for escalated alerts.
        If not specified, the monitor will use the standard channel for escalated alerts.
  b) warn: An optional block that defines the warning threshold and alerting channel for the monitor.
        It includes the same parameters as the critical block.
  c) custom: An optional block that allows for customizing the query and rolling window for the monitor.
          It includes the following parameters:
    1) rolling_window:
          An optional parameter that specifies the rolling window for the monitor evaluation.
          If not specified, the default rolling window is last_10m.
    2) query:
          An optional parameter that allows for passing a custom monitor query to override the standard query.
  EOF
  type = map(object({
    recovery = optional(object({
      recovery_channel = optional(string)
    }))
    critical = object({
      threshold          = number
      recovery_threshold = optional(number)
      alert_channel      = optional(string)
      escalated_channel  = optional(string)
    })
    warn = optional(object({
      threshold          = number
      recovery_threshold = optional(number)
      alert_channel      = optional(string)
      escalated_channel  = optional(string)
    }))
    custom = optional(object({
      rolling_window = optional(string)
      query          = optional(string)
    }))
  }))
  default = {
    slo_error_rate_monitor                  = { critical = { threshold = 0.001 } }
    latency_monitor                         = { critical = { threshold = 0.3 } }
    latency_next_js_monitor                 = { critical = { threshold = 0.3 } }
    apdex_monitor                           = { critical = { threshold = 0.9 } }
    p90_latency_monitor                     = { critical = { threshold = 1 } }
    abnormal_throughput_monitor             = { critical = { threshold = 1 } }
    http_client_latency_monitor             = { critical = { threshold = 0.5 } }
    http_client_post_latency_monitor        = { critical = { threshold = 1 } }
    http_client_p90_latency_monitor         = { critical = { threshold = 1 } }
    http_client_error_rate_monitor          = { critical = { threshold = 0.05 } }
    http_client_abnormal_throughput_monitor = { critical = { threshold = 1 } }
    cpu_usage                               = { critical = { threshold = 75 } }
    cpu_usage_container                     = { critical = { threshold = 75 } }
    memory_usage                            = { critical = { threshold = 2047483648 } }
    cache_usage                             = { critical = { threshold = 209715200 } }
    network_sent                            = { critical = { threshold = 5000000 } }
    network_recv                            = { critical = { threshold = 5000000 } }
  }
}
variable "monitors" {
  description = "Datadog default monitors threshold."
  default = {
    slo_error_rate_monitor                  = 0.001
    latency_monitor                         = 0.3
    latency_next_js_monitor                 = 0.3
    apdex_monitor                           = 0.9
    p90_latency_monitor                     = 1
    abnormal_throughput_monitor             = 1
    http_client_latency_monitor             = 0.5
    http_client_post_latency_monitor        = 1
    http_client_p90_latency_monitor         = 1
    http_client_error_rate_monitor          = 0.05
    http_client_abnormal_throughput_monitor = 1
    cpu_usage                               = 75
    cpu_usage_container                     = 75
    memory_usage                            = 2047483648
    cache_usage                             = 209715200
    network_sent                            = 5000000
    network_recv                            = 5000000
  }
}

variable "monitors_configuration_enabled" {
  description = "Enable Monitor Configuration"
  type        = bool
  default     = false
}


variable "environment_shortname" {
  type = string
  validation {
    condition     = length(var.environment_shortname) > 0
    error_message = "Variable 'environment_shortname' cannot be empty."
  }
}

variable "health_check_route" {
  type = string
  validation {
    condition     = length(var.health_check_route) > 0 && substr(var.health_check_route, 0, 1) == "/"
    error_message = "Variable 'health_check_route' must be provided and must start with a slash."
  }
}

variable "certificate_arn" {
  type = string
  validation {
    condition     = length(var.certificate_arn) > 0
    error_message = "Variable 'certificate_arn' must be provided."
  }
}

variable "additional_certificate_arns" {
  type        = list(string)
  default     = []
  description = "To add multiple certificates for the arn"
}

variable "service_domain" {
  description = "This is the URL of the service which will be used publicly in Route53 to access this application."
  type        = string
  validation {
    condition     = length(var.service_domain) > 0 && length(split(".", var.service_domain)) >= 2
    error_message = "Variable 'service_domain' must be provided and must be of format 'domain_name.tld' and more."
  }
}

variable "codedeploy_deployment_config" {
  type    = string
  default = "CodeDeployDefault.ECSAllAtOnce"
}

variable "codedeploy_blue_termination_wait_time_in_minutes" {
  type    = number
  default = 0
}

variable "iam_ecs_execution_role" {
  type = string
  validation {
    condition     = length(var.iam_ecs_execution_role) > 0
    error_message = "Variable 'iam_ecs_execution_role' must be provided."
  }
}

variable "iam_ecs_execution_policy" {
  type = string
  validation {
    condition     = length(var.iam_ecs_execution_policy) > 0
    error_message = "Variable 'iam_ecs_execution_policy' must be provided."
  }
}

variable "iam_ecs_task_role" {
  type = string
  validation {
    condition     = length(var.iam_ecs_task_role) > 0
    error_message = "Variable 'iam_ecs_task_role' must be provided."
  }
}

variable "iam_ecs_task_policy" {
  type = string
  validation {
    condition     = length(var.iam_ecs_task_policy) > 0
    error_message = "Variable 'iam_ecs_task_policy' must be provided."
  }
}

variable "dns_is_weighted" {
  type    = bool
  default = false
}

variable "dns_weight" {
  type    = number
  default = 255
}

variable "dns_weighted_identifier" {
  type    = string
  default = "ecs-apps"
  validation {
    condition     = length(var.dns_weighted_identifier) > 0
    error_message = "Variable 'dns_weighted_identifier' must be provided."
  }
}

variable "team" {
  type        = string
  description = "The name of the team which owns this service"
  default     = "cbh"
  validation {
    condition     = length(var.team) > 0
    error_message = "You must provide a team name."
  }
}

variable "alb_health_check_interval" {
  description = "Approximate amount of time, in seconds, between health checks of an individual target."
  type        = number
  default     = 60
  validation {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group#interval
    condition     = var.alb_health_check_interval >= 5 && var.alb_health_check_interval <= 300
    error_message = "The variable 'alb_health_check_interval' should have a value between 5 and 300."
  }
}

variable "alb_health_check_timeout" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check."
  type        = number
  default     = 30
  validation {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group#timeout
    condition     = var.alb_health_check_timeout >= 2 && var.alb_health_check_timeout <= 120
    error_message = "The variable 'alb_health_check_timeout' should have a value between 2 and 120."
  }
}

variable "domain_index_route53" {
  description = <<EOF
This specifies what index to cut the service_domain in respect of querying for the hosted zone.
Say we have a 'service_domain' of backend-main.prod.clipboardhealth.org,
the hosted zone can either be 'clipboardhealth.org' or 'prod.clipboardhealth.org' which complicates a aws_route53_zone search.
Previously, this assumed it was always 'prod.clipboardhealth.org' which is not correct.
This variable allows the end user to configure how this is performed.
To ensure backward compatibility, the default value of 1 which specifies only the earliest part of the domain eg 'backend-main' gets dropped has been configured.
EOF
  type        = number
  default     = 1
}

variable "is_internal_service" {
  description = "It creates the internal Alb. The service is not exposed to internet."
  type        = bool
  default     = false
}

variable "access_logs_enabled" {
  default     = true
  type        = bool
  description = "To enable or disable access_logs"
}

variable "enable_deletion_protection" {
  default     = true
  type        = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer"
}

variable "networking_workspace" {
  default     = ""
  type        = string
  description = "Allows overriding the workspace part of the networking name"
}

variable "ecs_cluster_workspace" {
  default     = ""
  type        = string
  description = "Allows overriding the workspace part of the cluster name"
}
