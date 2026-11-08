variable "metric_enable" {
  type        = bool
  default     = false
  description = "Enable metric SLO"
}
variable "metric_name" {
  default     = null
  type        = string
  description = "The metric name of the DataDog SLO"

}
variable "monitor_enable" {
  type        = bool
  default     = false
  description = "Enable monitor SLO"
}

variable "monitor_name" {
  type        = string
  default     = null
  description = "The monitor name of the DataDog SLO"

}

variable "metric_kind" {
  default     = "metric"
  type        = string
  description = "The metric type of the DataDog SLO. This can either be metric or monitor"
}

variable "monitor_kind" {
  default     = "monitor"
  type        = string
  description = "The monitor type of the DataDog SLO. This can either be metric or monitor"
}

variable "metric_description" {
  default     = ""
  type        = string
  description = "The metric description of the DataDog SLO"
}

variable "monitor_description" {
  default     = ""
  type        = string
  description = "The monitor description of the DataDog SLO"
}

variable "metric_threshold" {
  type = list(object({
    timeframe = string
    target    = number
    warning   = number
  }))
  description = "A list of thresholds and targets that define the service level objectives from the provided SLIs for the metric"
  default = [
    {
      timeframe = "7d"
      target    = 99.9
      warning   = 99.95
  }]
}
variable "monitor_threshold" {
  type = list(object({
    timeframe = string
    target    = number
    warning   = number
  }))
  description = "A list of thresholds and targets that define the service level objectives from the provided SLIs for the metric"
  default = [
    {
      timeframe = null
      target    = null
      warning   = null
  }]
}

variable "metric_tags" {
  type        = list(string)
  description = "The Metric tags of the DataDog SLO"
  default     = [""]
}


variable "monitor_tags" {
  type        = list(string)
  description = "The Monitor tags of the DataDog SLO"
  default     = [""]
}

variable "queries" {
  type = list(object({
    numerator   = string
    denominator = string
  }))
  description = "The queries of the DataDog SLO"
  default = [
    {
      numerator   = "sum:datadog.agent.up{*,host:$host}"
      denominator = "sum:datadog.agent.up{*,host:$host}"
  }]
}

variable "metric_force_delete" {
  type        = bool
  description = "Whether to force delete the SLO of the metric"
  default     = true
}

variable "monitor_force_delete" {
  type        = bool
  description = "Whether to force delete the SLO of the metric"
  default     = true
}

variable "monitor_ids" {
  type        = list(string)
  default     = null
  description = "The monitor ids of the DataDog SLO"
}

variable "team" {
  type        = string
  description = "Team to managing the app"
}

variable "service" {
  type        = string
  description = "Service of the application"
}

variable "environment" {
  type        = string
  description = "Environment of the application"
}
