variable "environment" {
  type = string
  validation {
    condition     = length(var.environment) > 0
    error_message = "Variable 'environment' must be provided."
  }
}

variable "product" {
  default = "cbh"
}

variable "service" {
  type = string
  validation {
    condition     = length(var.service) > 0
    error_message = "Variable 'service' must be provided."
  }
}

variable "team" {
  description = "The team who owns this RDS"
  type        = string
  validation {
    condition     = length(var.team) > 0
    error_message = "You must give your team name."
  }
}

variable "engine" {
  type = string
  validation {
    condition     = length(var.engine) > 0
    error_message = "Variable 'engine' must be provided."
  }
}

variable "engine_version" {
  type = string
  validation {
    condition     = length(var.engine_version) > 0
    error_message = "Variable 'engine_version' must be provided."
  }
}

variable "database_uri_scheme" {
  type = string
  validation {
    condition     = length(var.database_uri_scheme) > 0
    error_message = "Variable 'database_uri_scheme' must be provided (ex - postgres, mysql,)."
  }
}

variable "database_port" {
  default = "5432"
  type    = string
}

variable "database_name" {
  type = string
  validation {
    condition     = length(var.database_name) > 0
    error_message = "Variable 'database_name' must be provided."
  }
}

variable "database_username" {
  type = string
  validation {
    condition     = length(var.database_username) > 0
    error_message = "Variable 'database_username' must be provided."
  }
}

variable "password_length" {
  default = 16
}

variable "password_special_characters" {
  default = false
}

variable "backup_retention_period" {
  default     = 30
  description = "Database backup will be ratained for the provided number of days"
}

variable "preferred_backup_window" {
  default     = "03:00-03:30"
  description = "Run database backup at this time"
}

variable "preferred_maintenance_window" {
  default     = "Sat:03:30-Sat:04:00"
  description = "Apply pending changes / minor upgrades during this time"
}

variable "storage_encrypted" {
  type    = bool
  default = true
}

variable "instance_count" {
  default     = 1
  description = "Number of instances inside the database cluster"
}

variable "instance_class" {
  type = string
  validation {
    condition     = length(var.instance_class) > 0
    error_message = "Variable 'instance_class' must be provided (ex - 'db.t3.medium')."
  }
}

variable "performance_insights_enabled" {
  type    = bool
  default = true
}

variable "ssm_parameter_name" {
  description = "Parameter name to use while storing database uri on SSM"
  type        = string
  validation {
    condition     = length(var.ssm_parameter_name) > 0
    error_message = "You must give the SSM parameter address for the RDS URL."
  }
}

variable "ssm_parameter_name_reader" {
  description = "Parameter name to use while storing reader database uri on SSM"
  type        = string
  default     = ""
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "parameter_group_details" {
  description = "Format - [{ name = '', value = '', apply_method = ''}, ]"
  default = [
    {
      name         = "pgaudit.log"
      value        = "all"
      apply_method = "pending-reboot"
    },
    {
      name         = "pgaudit.log_catalog"
      value        = "1"
      apply_method = "pending-reboot"
    }
  ]
  type = list(object({
    name         = string
    value        = string
    apply_method = string
  }))
}

variable "parameter_group_family" {
  default     = ""
  description = "The family of the DB cluster parameter group"
}

variable "create_parameter_group" {
  type    = bool
  default = true
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "Indicates if the instance is allowed to auto upgrade minor versions"
}

variable "rds_extra_params" {
  type        = string
  default     = ""
  description = "Provide extra RDS params which needs to be appended at the end of the database connection string. Example: connection_limit=35"
}

variable "rds_extra_params_reader" {
  type        = string
  default     = ""
  description = "Provide extra RDS params which needs to be appended at the end of the reader database connection string. Example: connection_limit=35"
}

variable "ingress_cidrs" {
  default     = []
  description = "List or cidrs to allow in-bound connection to database"
}

variable "networking_environment" {
  type = string
  validation {
    condition     = length(var.networking_environment) > 0
    error_message = "Variable 'networking_environment' must be provided."
  }
}

variable "monitor_enabled" {
  description = "Create the DD monitoring for RDS instance"
  type        = bool
  default     = true
}

variable "alertchannel" {
  description = "Slack channel to send the monitor alerts"
  type        = string
  validation {
    condition     = length(var.alertchannel) > 0
    error_message = "Variable 'alertchannel' must be provided."
  }
}

variable "monitors" {
  description = "A list with customized monitors. Remember to create focused on RDS only."
  type = list(object({
    message = string
    name    = string
    query   = string
    threshold = list(object({
      warning           = number
      warning_recovery  = number
      critical          = number
      critical_recovery = number
    }))
    }
  ))
  validation {
    condition = alltrue([
      for monitor in var.monitors : length(regexall("^\\w+\\(\\w+\\):.*{(.*,)?%s(,.*)?}.*", monitor.query)) > 0
    ])
    error_message = "The query must have the word `%s` once in que DD query part, so the module can inject the environment and dbinstanceidentifier for each RDS instance."
  }
  default = [
    {
      message   = "High database connection"
      name      = "connection is high"
      query     = "avg(last_5m):sum:aws.rds.database_connections{%s} > 50"
      threshold = [{ warning = 40, warning_recovery = null, critical = 50, critical_recovery = null }]
    },
    {
      message   = "High CPU utilization for database"
      name      = "CPU metrics is high"
      query     = "avg(last_5m):sum:aws.rds.cpuutilization{%s} > 60"
      threshold = [{ warning = 40, warning_recovery = null, critical = 60, critical_recovery = null }]
    },
    {
      message   = "Low free memory available for database"
      name      = "low free memory metrics"
      query     = "avg(last_5m):sum:aws.rds.freeable_memory{%s} < 52428800"
      threshold = [{ warning = 104857600, warning_recovery = null, critical = 52428800, critical_recovery = null }]
    },
    {
      message   = "High storage utilization for database"
      name      = "storage metrics is high"
      query     = "avg(last_5m):sum:aws.rds.free_local_storage{%s} < 2147483648"
      threshold = [{ warning = 3221225472, warning_recovery = null, critical = 2147483648, critical_recovery = null }]
    },
    {
      message   = "High read iops for database"
      name      = "read IOps metrics is high"
      query     = "avg(last_5m):sum:aws.rds.read_iops{%s} > 300"
      threshold = [{ warning = 200, warning_recovery = null, critical = 300, critical_recovery = null }]
    },
    {
      message   = "High write iops for database"
      name      = "write IOps metrics is high"
      query     = "avg(last_5m):sum:aws.rds.write_iops{%s} > 200"
      threshold = [{ warning = 100, warning_recovery = null, critical = 200, critical_recovery = null }]
    },
    {
      message   = "High write latency for database"
      name      = "write latency metrics is high"
      query     = "avg(last_5m):sum:aws.rds.write_latency{%s} > 250"
      threshold = [{ warning = 200, warning_recovery = null, critical = 250, critical_recovery = null }]
    },
    {
      message   = "High read latency for database"
      name      = "read latency metrics is high"
      query     = "avg(last_5m):sum:aws.rds.read_latency{%s} > 150"
      threshold = [{ warning = 100, warning_recovery = null, critical = 150, critical_recovery = null }]
    }
  ]
}

variable "create_from_snapshot" {
  description = "create formsnapshot RDS instance"
  type        = bool
  default     = false
}

variable "snapshot_identifier" {
  description = "rds snapshot arn"
  type        = string
  default     = ""
}