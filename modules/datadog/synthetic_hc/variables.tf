variable "endpoint" {
  type = string
  validation {
    condition     = length(var.endpoint) > 0
    error_message = "Variable 'endpoint' must be provided."
  }
}

variable "alertchannel" {
  type = string
  validation {
    condition     = length(var.alertchannel) > 0
    error_message = "Variable 'alertchannel' must be provided."
  }
}

variable "service" {
  type = string
  validation {
    condition     = length(var.service) > 0
    error_message = "Variable 'service' must be provided."
  }
}

variable "product" {
  type = string
  validation {
    condition     = length(var.product) > 0
    error_message = "Variable 'product' must be provided."
  }
}

variable "environment" {
  type        = string
  description = "Environment of the application"
}
