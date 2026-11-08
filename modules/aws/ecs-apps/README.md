<!-- BEGIN_TF_DOCS -->
# AWS ECS Apps Module



## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.60.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_codedeploy_app.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_app) | resource |
| [aws_codedeploy_deployment_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codedeploy_deployment_group) | resource |
| [aws_ecs_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_execution_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ecs_task_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_certificate.clipboard_health](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_listener_certificate.clipboard_health_additional_certs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_listener_rule.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_lifecycle_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.alb_logs_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.alb_logs_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
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
go test -v ecs_apps_test.go
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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.60.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | >= 3.12.0 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | To enable or disable access\_logs | `bool` | `true` | no |
| <a name="input_additional_certificate_arns"></a> [additional\_certificate\_arns](#input\_additional\_certificate\_arns) | To add multiple certificates for the arn | `list(string)` | `[]` | no |
| <a name="input_alb_health_check_interval"></a> [alb\_health\_check\_interval](#input\_alb\_health\_check\_interval) | Approximate amount of time, in seconds, between health checks of an individual target. | `number` | `60` | no |
| <a name="input_alb_health_check_timeout"></a> [alb\_health\_check\_timeout](#input\_alb\_health\_check\_timeout) | Amount of time, in seconds, during which no response from a target means a failed health check. | `number` | `30` | no |
| <a name="input_alertchannel"></a> [alertchannel](#input\_alertchannel) | n/a | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | n/a | `string` | n/a | yes |
| <a name="input_codedeploy_blue_termination_wait_time_in_minutes"></a> [codedeploy\_blue\_termination\_wait\_time\_in\_minutes](#input\_codedeploy\_blue\_termination\_wait\_time\_in\_minutes) | n/a | `number` | `0` | no |
| <a name="input_codedeploy_deployment_config"></a> [codedeploy\_deployment\_config](#input\_codedeploy\_deployment\_config) | n/a | `string` | `"CodeDeployDefault.ECSAllAtOnce"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container that will receive the requests from the task load balancer. If not provided, will be <product>-<service\_name>. | `string` | `null` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port of the container that will receive the requests from the task load balancer. | `number` | `80` | no |
| <a name="input_create_task_definition"></a> [create\_task\_definition](#input\_create\_task\_definition) | Manage the task definition through terraform? | `bool` | `true` | no |
| <a name="input_datadog_agent_port"></a> [datadog\_agent\_port](#input\_datadog\_agent\_port) | n/a | `number` | `8126` | no |
| <a name="input_dns_is_weighted"></a> [dns\_is\_weighted](#input\_dns\_is\_weighted) | n/a | `bool` | `false` | no |
| <a name="input_dns_weight"></a> [dns\_weight](#input\_dns\_weight) | n/a | `number` | `255` | no |
| <a name="input_dns_weighted_identifier"></a> [dns\_weighted\_identifier](#input\_dns\_weighted\_identifier) | n/a | `string` | `"ecs-apps"` | no |
| <a name="input_domain_index_route53"></a> [domain\_index\_route53](#input\_domain\_index\_route53) | This specifies what index to cut the service\_domain in respect of querying for the hosted zone.<br>Say we have a 'service\_domain' of backend-main.prod.clipboardhealth.org,<br>the hosted zone can either be 'clipboardhealth.org' or 'prod.clipboardhealth.org' which complicates a aws\_route53\_zone search.<br>Previously, this assumed it was always 'prod.clipboardhealth.org' which is not correct.<br>This variable allows the end user to configure how this is performed.<br>To ensure backward compatibility, the default value of 1 which specifies only the earliest part of the domain eg 'backend-main' gets dropped has been configured. | `number` | `1` | no |
| <a name="input_ecs_platform_version"></a> [ecs\_platform\_version](#input\_ecs\_platform\_version) | n/a | `string` | `"1.4.0"` | no |
| <a name="input_ecs_scheduling_strategy"></a> [ecs\_scheduling\_strategy](#input\_ecs\_scheduling\_strategy) | n/a | `string` | `"REPLICA"` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer | `bool` | `true` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | n/a | `bool` | `true` | no |
| <a name="input_environment_shortname"></a> [environment\_shortname](#input\_environment\_shortname) | n/a | `string` | n/a | yes |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | n/a | `number` | `0` | no |
| <a name="input_health_check_route"></a> [health\_check\_route](#input\_health\_check\_route) | n/a | `string` | n/a | yes |
| <a name="input_iam_ecs_execution_policy"></a> [iam\_ecs\_execution\_policy](#input\_iam\_ecs\_execution\_policy) | n/a | `string` | n/a | yes |
| <a name="input_iam_ecs_execution_role"></a> [iam\_ecs\_execution\_role](#input\_iam\_ecs\_execution\_role) | n/a | `string` | n/a | yes |
| <a name="input_iam_ecs_task_policy"></a> [iam\_ecs\_task\_policy](#input\_iam\_ecs\_task\_policy) | n/a | `string` | n/a | yes |
| <a name="input_iam_ecs_task_role"></a> [iam\_ecs\_task\_role](#input\_iam\_ecs\_task\_role) | n/a | `string` | n/a | yes |
| <a name="input_is_internal_service"></a> [is\_internal\_service](#input\_is\_internal\_service) | It creates the internal Alb. The service is not exposed to internet. | `bool` | `false` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | n/a | `number` | `2` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | n/a | `number` | `1` | no |
| <a name="input_monitor_enabled"></a> [monitor\_enabled](#input\_monitor\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_monitors"></a> [monitors](#input\_monitors) | Datadog default monitors threshold. | `map` | <pre>{<br>  "abnormal_throughput_monitor": 1,<br>  "apdex_monitor": 0.9,<br>  "cache_usage": 209715200,<br>  "cpu_usage": 75,<br>  "cpu_usage_container": 75,<br>  "http_client_abnormal_throughput_monitor": 1,<br>  "http_client_error_rate_monitor": 0.05,<br>  "http_client_latency_monitor": 0.5,<br>  "http_client_p90_latency_monitor": 1,<br>  "http_client_post_latency_monitor": 1,<br>  "latency_monitor": 0.3,<br>  "latency_next_js_monitor": 0.3,<br>  "memory_usage": 2047483648,<br>  "network_recv": 5000000,<br>  "network_sent": 5000000,<br>  "p90_latency_monitor": 1,<br>  "slo_error_rate_monitor": 0.001<br>}</pre> | no |
| <a name="input_monitors_configuration"></a> [monitors\_configuration](#input\_monitors\_configuration) | Each monitor has the following configurations<br>  a) critical: A required block that defines the critical threshold and alerting channel for the monitor. It includes the following parameters:<br>    1) threshold:<br>        A required parameter that specifies the threshold value above which an alert will be triggered.<br>    2) recovery\_threshold:<br>        An optional parameter that specifies the recovery threshold value for the monitor.<br>        If the monitor triggers an alert and the metric value goes below this value,<br>        the alert will be automatically resolved. If not specified, the recovery threshold defaults to null.<br>    3) alert\_channel:<br>        An optional parameter that specifies the notification channel for the alert.<br>        If not specified, the monitor will use the standard channel for alerts.<br>    4) escalated\_channel:<br>        An optional parameter that specifies the notification channel for escalated alerts.<br>        If not specified, the monitor will use the standard channel for escalated alerts.<br>  b) warn: An optional block that defines the warning threshold and alerting channel for the monitor.<br>        It includes the same parameters as the critical block.<br>  c) custom: An optional block that allows for customizing the query and rolling window for the monitor.<br>          It includes the following parameters:<br>    1) rolling\_window:<br>          An optional parameter that specifies the rolling window for the monitor evaluation.<br>          If not specified, the default rolling window is last\_10m.<br>    2) query:<br>          An optional parameter that allows for passing a custom monitor query to override the standard query. | <pre>map(object({<br>    recovery = optional(object({<br>      recovery_channel = optional(string)<br>    }))<br>    critical = object({<br>      threshold          = number<br>      recovery_threshold = optional(number)<br>      alert_channel      = optional(string)<br>      escalated_channel  = optional(string)<br>    })<br>    warn = optional(object({<br>      threshold          = number<br>      recovery_threshold = optional(number)<br>      alert_channel      = optional(string)<br>      escalated_channel  = optional(string)<br>    }))<br>    custom = optional(object({<br>      rolling_window = optional(string)<br>      query          = optional(string)<br>    }))<br>  }))</pre> | <pre>{<br>  "abnormal_throughput_monitor": {<br>    "critical": {<br>      "threshold": 1<br>    }<br>  },<br>  "apdex_monitor": {<br>    "critical": {<br>      "threshold": 0.9<br>    }<br>  },<br>  "cache_usage": {<br>    "critical": {<br>      "threshold": 209715200<br>    }<br>  },<br>  "cpu_usage": {<br>    "critical": {<br>      "threshold": 75<br>    }<br>  },<br>  "cpu_usage_container": {<br>    "critical": {<br>      "threshold": 75<br>    }<br>  },<br>  "http_client_abnormal_throughput_monitor": {<br>    "critical": {<br>      "threshold": 1<br>    }<br>  },<br>  "http_client_error_rate_monitor": {<br>    "critical": {<br>      "threshold": 0.05<br>    }<br>  },<br>  "http_client_latency_monitor": {<br>    "critical": {<br>      "threshold": 0.5<br>    }<br>  },<br>  "http_client_p90_latency_monitor": {<br>    "critical": {<br>      "threshold": 1<br>    }<br>  },<br>  "http_client_post_latency_monitor": {<br>    "critical": {<br>      "threshold": 1<br>    }<br>  },<br>  "latency_monitor": {<br>    "critical": {<br>      "threshold": 0.3<br>    }<br>  },<br>  "latency_next_js_monitor": {<br>    "critical": {<br>      "threshold": 0.3<br>    }<br>  },<br>  "memory_usage": {<br>    "critical": {<br>      "threshold": 2047483648<br>    }<br>  },<br>  "network_recv": {<br>    "critical": {<br>      "threshold": 5000000<br>    }<br>  },<br>  "network_sent": {<br>    "critical": {<br>      "threshold": 5000000<br>    }<br>  },<br>  "p90_latency_monitor": {<br>    "critical": {<br>      "threshold": 1<br>    }<br>  },<br>  "slo_error_rate_monitor": {<br>    "critical": {<br>      "threshold": 0.001<br>    }<br>  }<br>}</pre> | no |
| <a name="input_monitors_configuration_enabled"></a> [monitors\_configuration\_enabled](#input\_monitors\_configuration\_enabled) | Enable Monitor Configuration | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | n/a | yes |
| <a name="input_service_domain"></a> [service\_domain](#input\_service\_domain) | This is the URL of the service which will be used publicly in Route53 to access this application. | `string` | n/a | yes |
| <a name="input_slo_enabled"></a> [slo\_enabled](#input\_slo\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_slo_next_js_enabled"></a> [slo\_next\_js\_enabled](#input\_slo\_next\_js\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_target_autoscaling_cpu"></a> [target\_autoscaling\_cpu](#input\_target\_autoscaling\_cpu) | n/a | `number` | `50` | no |
| <a name="input_target_autoscaling_memory"></a> [target\_autoscaling\_memory](#input\_target\_autoscaling\_memory) | n/a | `number` | `50` | no |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | The task definition to use for the service. This variable is mandatory if var.create\_task\_definition is true. | `string` | `null` | no |
| <a name="input_team"></a> [team](#input\_team) | The name of the team which owns this service | `string` | `"cbh"` | no |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_aws_ecs_service_name"></a> [aws\_ecs\_service\_name](#output\_aws\_ecs\_service\_name) | n/a |
| <a name="output_aws_route53_record"></a> [aws\_route53\_record](#output\_aws\_route53\_record) | n/a |
| <a name="output_ecs_execution_role"></a> [ecs\_execution\_role](#output\_ecs\_execution\_role) | n/a |
| <a name="output_ecs_task_role"></a> [ecs\_task\_role](#output\_ecs\_task\_role) | n/a |
<!-- END_TF_DOCS -->
