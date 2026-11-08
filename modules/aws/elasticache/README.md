# AWS Redis Module



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_parameter_group.elasticache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.redis_cluster_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.redis_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [terraform_remote_state.networking](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Testing
### Prerequisites
* [Go v1.15 or greater](https://go.dev/dl/)

### Make sure you have exported / configured aws credentials in your shell
### Required aws credential vars in shell
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_DEFAULT_REGION`

###  Run the following commands to test from the root of the repository:
* Test would take a 10+ mins to run as its created database cluster and instance
```shell
cd ./tests/aws/
go test -v elasticache_test.go
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
| <a name="input_cluster_mode"></a> [cluster\_mode](#input\_cluster\_mode) | n/a | `bool` | `false` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | `"redis"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | n/a | `number` | `1` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | n/a | `string` | `""` | no |
| <a name="input_parameter_groups"></a> [parameter\_groups](#input\_parameter\_groups) | n/a | <pre>list(object({<br>    key   = string<br>    value = any<br>  }))</pre> | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | n/a | `number` | `6379` | no |
| <a name="input_primary_replica_count"></a> [primary\_replica\_count](#input\_primary\_replica\_count) | n/a | `number` | `1` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | `"cbh"` | no |
| <a name="input_redis_node_type"></a> [redis\_node\_type](#input\_redis\_node\_type) | n/a | `string` | n/a | yes |
| <a name="input_redis_snapshot_retain_days"></a> [redis\_snapshot\_retain\_days](#input\_redis\_snapshot\_retain\_days) | Number of days to retain Redis snapshot. | `number` | `7` | no |
| <a name="input_redis_snapshot_window"></a> [redis\_snapshot\_window](#input\_redis\_snapshot\_window) | Redis snapshot window. | `string` | `"04:00-06:00"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_secondary_replica_count"></a> [secondary\_replica\_count](#input\_secondary\_replica\_count) | n/a | `number` | `0` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | n/a | yes |
| <a name="input_ssm_parameter_name"></a> [ssm\_parameter\_name](#input\_ssm\_parameter\_name) | n/a | `string` | n/a | yes |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_primary_endpoint"></a> [primary\_endpoint](#output\_primary\_endpoint) | n/a |
| <a name="output_secondary_endpoint"></a> [secondary\_endpoint](#output\_secondary\_endpoint) | n/a |
| <a name="output_ssm_parameter_url"></a> [ssm\_parameter\_url](#output\_ssm\_parameter\_url) | n/a |
