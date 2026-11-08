# DATADOG SLO
The configuration in this directory is used to generate the [Service Level Objectives](https://docs.datadoghq.com/integrations/service_level_objectives/) for your Datadog account.

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
