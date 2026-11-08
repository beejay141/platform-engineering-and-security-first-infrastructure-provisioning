variable "product" {
  description = "Prefix for the product"
  default     = "cbh"
}

variable "service" {
  description = "Name of the service to deploy"
  type        = string
}

variable "environment" {
  description = "Environment the application will be deployed under"
  type        = string
}

variable "shard_count" {
  description = "The number of shards that the stream will use"
  type        = number
  validation {
    condition     = var.shard_count > 0
    error_message = "Variable 'shard_count' must be greater than 0."
  }
}

variable "stream_retention_period" {
  description = "Length of time data records are accessible after they are added to the stream. Minimum value is 24."
  type        = number
  validation {
    condition     = var.stream_retention_period > 0
    error_message = "Variable 'stream_retention_period' must be greater than 0."
  }
}

variable "tags" {
  description = "Tags to apply under the kinesis resource"
  default     = {}
}

variable "stream_name" {
  description = "Name of the stream to be created"
  validation {
    condition     = length(var.stream_name) > 0
    error_message = "Variable 'stream_name' must not be empty."
  }
}
