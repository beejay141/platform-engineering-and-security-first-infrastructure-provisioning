# DATADOG MONITOR
The configuration in this directory is used to create a Datadog monitor.

## Usage

To run this integration, you need to have a Datadog account and a [Datadog API key](https://docs.datadoghq.com/account/api-keys/) and export the following environment variables:

```shell
export TF_VAR_DD_API_KEY=<your-api-key>
export TF_VAR_DD_APP_KEY=<your-app-key>

terraform init
terraform plan
terraform apply
```
When you are done, Destroy the resources using the following command:

```shell
terraform destroy
```
