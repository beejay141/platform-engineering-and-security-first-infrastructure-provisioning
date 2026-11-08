variable "DD_API_KEY" {
  default = ""
}
variable "DD_APP_KEY" {
  default = ""
}
variable "service" {
  default = "Example-Service"

}
variable "product" {
  default = "ClipboardHealth"
}
variable "monitor_name" {
  default = "Example-Monitor"
}
variable "monitor_description" {
  default = "This is the SLO configuration for the Example-Monitor"
}
variable "monitor_enable" {
  default = "true"

}

variable "metric_name" {
  default = "Example-Metric"
}
variable "metric_description" {
  default = "The is the SLO configuration for the Example-Metric"
}
variable "metric_enable" {
  default = "true"
}
