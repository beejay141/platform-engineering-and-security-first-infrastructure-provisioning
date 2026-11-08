<!-- BEGIN_TF_DOCS -->
# Datadog Monitors



## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 3.17.0 |

## Resources

| Name | Type |
|------|------|
| [datadog_synthetics_test.healthcheck](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test) | resource |

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
| <a name="input_DD_API_KEY"></a> [DD\_API\_KEY](#input\_DD\_API\_KEY) | n/a | `string` | n/a | yes |
| <a name="input_DD_APP_KEY"></a> [DD\_APP\_KEY](#input\_DD\_APP\_KEY) | n/a | `string` | n/a | yes |
| <a name="input_alertchannel"></a> [alertchannel](#input\_alertchannel) | n/a | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitor_id"></a> [monitor\_id](#output\_monitor\_id) | n/a |
<!-- END_TF_DOCS -->
