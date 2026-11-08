<!-- BEGIN_TF_DOCS -->
# Datadog SLO



## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | >= 3.12.0 |

## Resources

| Name | Type |
|------|------|
| [datadog_service_level_objective.this](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/service_level_objective) | resource |
| [datadog_service_level_objective.this_monitor](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/service_level_objective) | resource |

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


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datadog_api_key"></a> [datadog\_api\_key](#input\_datadog\_api\_key) | Datadog API Key | `string` | n/a | yes |
| <a name="input_datadog_app_key"></a> [datadog\_app\_key](#input\_datadog\_app\_key) | Datadog Application Key | `string` | n/a | yes |
| <a name="input_metric_description"></a> [metric\_description](#input\_metric\_description) | The metric description of the DataDog SLO | `string` | `""` | no |
| <a name="input_metric_enable"></a> [metric\_enable](#input\_metric\_enable) | Enable metric SLO | `bool` | `false` | no |
| <a name="input_metric_force_delete"></a> [metric\_force\_delete](#input\_metric\_force\_delete) | Whether to force delete the SLO of the metric | `bool` | `true` | no |
| <a name="input_metric_kind"></a> [metric\_kind](#input\_metric\_kind) | The metric type of the DataDog SLO. This can either be metric or monitor | `string` | `"metric"` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | The metric name of the DataDog SLO | `string` | `null` | no |
| <a name="input_metric_tags"></a> [metric\_tags](#input\_metric\_tags) | The Metric tags of the DataDog SLO | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_metric_threshold"></a> [metric\_threshold](#input\_metric\_threshold) | A list of thresholds and targets that define the service level objectives from the provided SLIs for the metric | <pre>list(object({<br>    timeframe = string<br>    target    = number<br>    warning   = number<br>  }))</pre> | <pre>[<br>  {<br>    "target": 99.9,<br>    "timeframe": "7d",<br>    "warning": 99.95<br>  }<br>]</pre> | no |
| <a name="input_monitor_description"></a> [monitor\_description](#input\_monitor\_description) | The monitor description of the DataDog SLO | `string` | `""` | no |
| <a name="input_monitor_enable"></a> [monitor\_enable](#input\_monitor\_enable) | Enable monitor SLO | `bool` | `false` | no |
| <a name="input_monitor_force_delete"></a> [monitor\_force\_delete](#input\_monitor\_force\_delete) | Whether to force delete the SLO of the metric | `bool` | `true` | no |
| <a name="input_monitor_ids"></a> [monitor\_ids](#input\_monitor\_ids) | The monitor ids of the DataDog SLO | `list(string)` | `null` | no |
| <a name="input_monitor_kind"></a> [monitor\_kind](#input\_monitor\_kind) | The monitor type of the DataDog SLO. This can either be metric or monitor | `string` | `"monitor"` | no |
| <a name="input_monitor_name"></a> [monitor\_name](#input\_monitor\_name) | The monitor name of the DataDog SLO | `string` | `null` | no |
| <a name="input_monitor_tags"></a> [monitor\_tags](#input\_monitor\_tags) | The Monitor tags of the DataDog SLO | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_monitor_threshold"></a> [monitor\_threshold](#input\_monitor\_threshold) | A list of thresholds and targets that define the service level objectives from the provided SLIs for the metric | <pre>list(object({<br>    timeframe = string<br>    target    = number<br>    warning   = number<br>  }))</pre> | <pre>[<br>  {<br>    "target": null,<br>    "timeframe": null,<br>    "warning": null<br>  }<br>]</pre> | no |
| <a name="input_queries"></a> [queries](#input\_queries) | The queries of the DataDog SLO | <pre>list(object({<br>    numerator   = string<br>    denominator = string<br>  }))</pre> | <pre>[<br>  {<br>    "denominator": "sum:datadog.agent.up{*,host:$host}",<br>    "numerator": "sum:datadog.agent.up{*,host:$host}"<br>  }<br>]</pre> | no |
| <a name="input_service"></a> [service](#input\_service) | Service of the application | `string` | n/a | yes |
| <a name="input_team"></a> [team](#input\_team) | Team to managing the app | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->