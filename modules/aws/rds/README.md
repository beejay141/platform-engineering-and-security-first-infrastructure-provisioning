<!-- BEGIN_TF_DOCS -->
# AWS RDS Module



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_parameter_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.aurora](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.aurora_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.database_reader_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.database_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.master_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
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
go test -v rds_test.go
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
| <a name="input_alertchannel"></a> [alertchannel](#input\_alertchannel) | Slack channel to send the monitor alerts | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | n/a | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates if the instance is allowed to auto upgrade minor versions | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Database backup will be ratained for the provided number of days | `number` | `30` | no |
| <a name="input_create_from_snapshot"></a> [create\_from\_snapshot](#input\_create\_from\_snapshot) | create formsnapshot RDS instance | `bool` | `false` | no |
| <a name="input_create_parameter_group"></a> [create\_parameter\_group](#input\_create\_parameter\_group) | n/a | `bool` | `false` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | n/a | `string` | n/a | yes |
| <a name="input_database_port"></a> [database\_port](#input\_database\_port) | n/a | `string` | `"5432"` | no |
| <a name="input_database_uri_scheme"></a> [database\_uri\_scheme](#input\_database\_uri\_scheme) | n/a | `string` | n/a | yes |
| <a name="input_database_username"></a> [database\_username](#input\_database\_username) | n/a | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_ingress_cidrs"></a> [ingress\_cidrs](#input\_ingress\_cidrs) | List or cidrs to allow in-bound connection to database | `list` | `[]` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | n/a | `string` | n/a | yes |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances inside the database cluster | `number` | `1` | no |
| <a name="input_monitor_enabled"></a> [monitor\_enabled](#input\_monitor\_enabled) | Create the DD monitoring for RDS instance | `bool` | `true` | no |
| <a name="input_monitors"></a> [monitors](#input\_monitors) | A list with customized monitors. Remember to create focused on RDS only. | <pre>list(object({<br>    message = string<br>    name    = string<br>    query   = string<br>    threshold = list(object({<br>      warning           = number<br>      warning_recovery  = number<br>      critical          = number<br>      critical_recovery = number<br>    }))<br>    }<br>  ))</pre> | <pre>[<br>  {<br>    "message": "High database connection",<br>    "name": "connection is high",<br>    "query": "avg(last_5m):sum:aws.rds.database_connections{%s} > 50",<br>    "threshold": [<br>      {<br>        "critical": 50,<br>        "critical_recovery": null,<br>        "warning": 40,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High CPU utilization for database",<br>    "name": "CPU metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.cpuutilization{%s} > 60",<br>    "threshold": [<br>      {<br>        "critical": 60,<br>        "critical_recovery": null,<br>        "warning": 40,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "Low free memory available for database",<br>    "name": "low free memory metrics",<br>    "query": "avg(last_5m):sum:aws.rds.freeable_memory{%s} < 52428800",<br>    "threshold": [<br>      {<br>        "critical": 52428800,<br>        "critical_recovery": null,<br>        "warning": 104857600,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High storage utilization for database",<br>    "name": "storage metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.free_local_storage{%s} < 2147483648",<br>    "threshold": [<br>      {<br>        "critical": 2147483648,<br>        "critical_recovery": null,<br>        "warning": 3221225472,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High read iops for database",<br>    "name": "read IOps metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.read_iops{%s} > 300",<br>    "threshold": [<br>      {<br>        "critical": 300,<br>        "critical_recovery": null,<br>        "warning": 200,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High write iops for database",<br>    "name": "write IOps metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.write_iops{%s} > 200",<br>    "threshold": [<br>      {<br>        "critical": 200,<br>        "critical_recovery": null,<br>        "warning": 100,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High write latency for database",<br>    "name": "write latency metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.write_latency{%s} > 250",<br>    "threshold": [<br>      {<br>        "critical": 250,<br>        "critical_recovery": null,<br>        "warning": 200,<br>        "warning_recovery": null<br>      }<br>    ]<br>  },<br>  {<br>    "message": "High read latency for database",<br>    "name": "read latency metrics is high",<br>    "query": "avg(last_5m):sum:aws.rds.read_latency{%s} > 150",<br>    "threshold": [<br>      {<br>        "critical": 150,<br>        "critical_recovery": null,<br>        "warning": 100,<br>        "warning_recovery": null<br>      }<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_networking_environment"></a> [networking\_environment](#input\_networking\_environment) | n/a | `string` | n/a | yes |
| <a name="input_parameter_group_details"></a> [parameter\_group\_details](#input\_parameter\_group\_details) | Format - [{ name = '', value = '', apply\_method = ''}, ] | `string` | `""` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | The family of the DB cluster parameter group | `string` | `""` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | n/a | `number` | `16` | no |
| <a name="input_password_special_characters"></a> [password\_special\_characters](#input\_password\_special\_characters) | n/a | `bool` | `false` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Run database backup at this time | `string` | `"03:00-03:30"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | Apply pending changes / minor upgrades during this time | `string` | `"Sat:03:30-Sat:04:00"` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | `"cbh"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | n/a | `bool` | `false` | no |
| <a name="input_rds_extra_params"></a> [rds\_extra\_params](#input\_rds\_extra\_params) | Provide extra RDS params which needs to be appended at the end of the database connection string. Example: connection\_limit=35 | `string` | `""` | no |
| <a name="input_rds_extra_params_reader"></a> [rds\_extra\_params\_reader](#input\_rds\_extra\_params\_reader) | Provide extra RDS params which needs to be appended at the end of the reader database connection string. Example: connection\_limit=35 | `string` | `""` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `bool` | `true` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | rds snapshot arn | `string` | `""` | no |
| <a name="input_ssm_parameter_name"></a> [ssm\_parameter\_name](#input\_ssm\_parameter\_name) | Parameter name to use while storing database uri on SSM | `string` | n/a | yes |
| <a name="input_ssm_parameter_name_reader"></a> [ssm\_parameter\_name\_reader](#input\_ssm\_parameter\_name\_reader) | Parameter name to use while storing reader database uri on SSM | `string` | `""` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | n/a | `bool` | `true` | no |
| <a name="input_team"></a> [team](#input\_team) | The team who owns this RDS | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
