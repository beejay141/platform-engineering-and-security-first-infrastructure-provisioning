<!-- BEGIN_TF_DOCS -->
# Datadog Monitors



## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.12.0 |

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.this](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Testing
### Prerequisites
* [Go v1.15 or greater](https://go.dev/dl/)

### Export the following variables with the following commands:
```shell
export TF_VAR_datadog_api_key="<your-api-key>"
export TF_VAR_datadog_app_key="<your-app-key>"
```
###  Run the following commands to test from the root of the repository:
```shell
go test -v ./...
```
## Generating Documentation
### Prerequisites
* [Terraform Docs](https://terraform-docs.io/)

### Run the following commands to generate documentation
```shell
terraform-docs markdown  --output-file README.md --output-mode inject .
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.12.0 |

You have to add the datadog provider in your terraform code in order to use
this module.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API Key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog Application Key | `string` | n/a | yes |
| <a name="input_monitor_escalation_message"></a> [monitor\_escalation\_message](#input\_monitor\_escalation\_message) | message to include with a re-notification. Supports the @username notification allowed elsewhere. | `string` | `null` | no |
| <a name="input_monitor_include_tags"></a> [monitor\_include\_tags](#input\_monitor\_include\_tags) | whether notifications from this monitor automatically insert its triggering tags into the title. | `bool` | `true` | no |
| <a name="input_monitor_message"></a> [monitor\_message](#input\_monitor\_message) | Message to be displayed in the monitor. Email notifications can be sent to specific users by using the same @username notation as events. | `string` | n/a | yes |
| <a name="input_monitor_name"></a> [monitor\_name](#input\_monitor\_name) | Name of the monitor. | `string` | n/a | yes |
| <a name="input_monitor_notify_audit"></a> [monitor\_notify\_audit](#input\_monitor\_notify\_audit) | whether tagged users will be notified on changes to this monitor. | `bool` | `false` | no |
| <a name="input_monitor_notify_no_data"></a> [monitor\_notify\_no\_data](#input\_monitor\_notify\_no\_data) | Whether this monitor will notify when data stops reporting. | `bool` | `false` | no |
| <a name="input_monitor_query"></a> [monitor\_query](#input\_monitor\_query) | Query to be used for the monitor | `string` | n/a | yes |
| <a name="input_monitor_renotify_interval"></a> [monitor\_renotify\_interval](#input\_monitor\_renotify\_interval) | How often (in seconds) to re-notify on an alert. The number of minutes after the last notification before a monitor will re-notify on the current status | `number` | `60` | no |
| <a name="input_monitor_tags"></a> [monitor\_tags](#input\_monitor\_tags) | Tags to be added to the monitor. | `list(string)` | n/a | yes |
| <a name="input_monitor_threshold"></a> [monitor\_threshold](#input\_monitor\_threshold) | Alert thresholds to be used for the monitor. | <pre>list(object({<br>    warning           = number<br>    warning_recovery  = number<br>    critical          = number<br>    critical_recovery = number<br><br>  }))</pre> | <pre>[<br>  {<br>    "critical": null,<br>    "critical_recovery": null,<br>    "warning": null,<br>    "warning_recovery": null<br>  }<br>]</pre> | no |
| <a name="input_monitor_type"></a> [monitor\_type](#input\_monitor\_type) | Type of the monitor. Valid values are: composite, event alert, log alert, metric alert, process alert, query alert, rum alert, service check, synthetics alert, trace-analytics alert, slo alert, event-v2 alert, audit alert, ci-pipelines alert, error-tracking alert. | `string` | `"metric alert"` | no |
| <a name="input_service"></a> [service](#input\_service) | Service of the application | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input\_team) | Team to managing the app | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datadog_monitor_id"></a> [datadog\_monitor\_id](#output\_datadog\_monitor\_id) | ID of the Datadog monitor |
| <a name="output_datadog_monitor_name"></a> [datadog\_monitor\_name](#output\_datadog\_monitor\_name) | Name of the Datadog monitor |
<!-- END_TF_DOCS -->