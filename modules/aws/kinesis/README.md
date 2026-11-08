<!-- BEGIN_TF_DOCS -->
# AWS Kinesis Module
This creates a kinesis stream for consumption by end-user clients.



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_stream.streams](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |

## Testing
### Prerequisites
* [Go v1.15 or greater](https://go.dev/dl/)

### Make sure you have exported / configured aws credentials in your shell
### Required aws credential vars in shell
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_DEFAULT_REGION`

###  Run the following commands to test from the root of the repository:
```shell
cd ./tests/aws/
go test -v kinesis_test.go
```

## Generating Documentation
### Prerequisites
* [Terraform Docs](https://terraform-docs.io/)

### Run the following commands to generate documentation
```shell
terraform-docs markdown  --output-file README.md --output-mode inject .
```


## Requirements

No requirements.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment the application will be deployed under | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Prefix for the product | `string` | `"cbh"` | no |
| <a name="input_service"></a> [service](#input\_service) | Name of the service to deploy | `string` | n/a | yes |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | The number of shards that the stream will use | `number` | n/a | yes |
| <a name="input_stream_retention_period"></a> [stream\_retention\_period](#input\_stream\_retention\_period) | Length of time data records are accessible after they are added to the stream. Minimum value is 24. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply under the kinesis resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stream_arn"></a> [stream\_arn](#output\_stream\_arn) | n/a |
<!-- END_TF_DOCS -->
