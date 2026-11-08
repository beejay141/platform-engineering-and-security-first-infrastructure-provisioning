variable "workspace" {
  type = string
  validation {
    condition     = length(var.workspace) > 0
    error_message = "Variable 'workspace' must be provided."
  }
}

variable "product" {
  type    = string
  default = "cbh"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "service" {
  type = string
  validation {
    condition     = length(var.service) > 0
    error_message = "Variable 'service' must be provided."
  }
}

variable "redis_node_type" {
  type = string
  validation {
    condition     = length(var.redis_node_type) > 0 && substr(var.redis_node_type, 0, 5) == "cache"
    error_message = "Variable 'redis_node_type' must be provided and must have the prefix 'cache'."
  }
}

variable "ssm_parameter_name" {
  type = string
  validation {
    condition     = length(var.ssm_parameter_name) > 0 && substr(var.ssm_parameter_name, 0, 1) == "/"
    error_message = "Variable 'ssm_parameter_name' must be provided and must start with a slash."
  }
}

variable "cluster_mode" {
  type    = bool
  default = false
}

variable "secondary_replica_count" {
  type    = number
  default = 0
}

variable "parameter_groups" {
  type = list(object({
    key   = string
    value = any
  }))
  default = []
}

variable "primary_replica_count" {
  type    = number
  default = 1
}

variable "num_cache_nodes" {
  type    = number
  default = 1
}

variable "port" {
  type    = number
  default = 6379
}

variable "engine" {
  type    = string
  default = "redis"
}

variable "engine_version" {
  type = string
  validation {
    condition     = length(var.engine_version) > 0
    error_message = "Variable 'engine_version' must be provided."
  }
}


variable "parameter_group_name" {
  type    = string
  default = ""
}

variable "redis_snapshot_window" {
  description = "Redis snapshot window."
  type        = string
  default     = "04:00-06:00"
}

variable "redis_snapshot_retain_days" {
  description = "Number of days to retain Redis snapshot."
  type        = number
  default     = 7
}
