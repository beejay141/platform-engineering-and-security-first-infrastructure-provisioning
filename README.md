# Terraform Modules for ClipboardHealth

## Architecture

```shell
├── CHANGELOG.md
├── commitlint.config.js
├── CONTRIBUTING.md
├── examples
│   └── datadog
│       ├── monitor
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── README.md
│       │   └── variables.tf
│       └── slo
│           ├── main.tf
│           ├── README.md
│           └── variables.tf
├── go.mod
├── go.sum
├── main.tf
├── Makefile
├── modules
│   ├── aws
│   │   ├── ecs-apps
│   │   │   ├── alb.tf
│   │   │   ├── codedeploy.tf
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── monitor.tf
│   │   │   ├── outputs.tf
│   │   │   ├── README.md
│   │   │   ├── slo.tf
│   │   │   ├── variables.tf
│   │   │   └── versions.tf
│   │   ├── elasticache
│   │   │   ├── data.tf
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── README.md
│   │   │   ├── security.tf
│   │   │   └── variables.tf
│   │   ├── kinesis
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   ├── README.md
│   │   │   └── variables.tf
│   │   └── rds
│   │       ├── data.tf
│   │       ├── main.tf
│   │       ├── monitoring.tf
│   │       ├── outputs.tf
│   │       ├── README.md
│   │       ├── security.tf
│   │       └── variables.tf
│   └── datadog
│       ├── monitor
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── README.md
│       │   ├── variables.tf
│       │   └── versions.tf
│       ├── slo
│       │   ├── main.tf
│       │   ├── README.md
│       │   ├── variables.tf
│       │   └── versions.tf
│       └── synthetic_hc
│           ├── main.tf
│           ├── outputs.tf
│           ├── README.md
│           ├── variables.tf
│           └── versions.tf
├── outputs.tf
├── README.md
├── scripts
│   └── validate.sh
├── terraform-docs.tmpl
├── tests
│   ├── aws
│   │   ├── ecs_apps_terraform
│   │   │   ├── policies
│   │   │   │   ├── ecs-assume-role.json
│   │   │   │   ├── ecs-execution-policy.json
│   │   │   │   ├── ecs-task-assume-role.json
│   │   │   │   └── ecs-task-policy.json
│   │   │   ├── test_aws_modules.tf
│   │   │   └── test_task_definition.json
│   │   ├── ecs_apps_test.go
│   │   ├── elasticache_terraform
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfstate
│   │   │   └── terraform.tfstate.backup
│   │   ├── elasticache_test.go
│   │   ├── kinesis_terraform
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfstate
│   │   │   └── terraform.tfstate.backup
│   │   ├── kinesis_test.go
│   │   ├── rds_terraform
│   │   │   └── main.tf
│   │   ├── rds_test.go
│   │   └── terraform.tfstate
│   ├── datadog
│   │   ├── monitor_terraform
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfstate
│   │   │   └── terraform.tfstate.backup
│   │   ├── monitor_test.go
│   │   ├── slo_terraform
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfstate
│   │   │   └── terraform.tfstate.backup
│   │   ├── slo_test.go
│   │   ├── synthetic_hc_terraform
│   │   │   ├── main.tf
│   │   │   ├── terraform.tfstate
│   │   │   └── terraform.tfstate.backup
│   │   └── synthetic_hc_test.go
│   └── tests.go
└── variables.tf
```

The Terraform modules are organized in a monorepo directory structure that mirrors as shown above.

## Implementation of the Modules

Please watch this [video](https://www.loom.com/share/67a47385794b4b8eb1e001296373bbca) to learn how to implement the modules.


## Variables and Variable Sets

These modules are built to integrate with Terraform Cloud remote variables as a means to secure and manage variables used in the application.

Therefore, unless a variable is certain to never change, opt to define variables in the TFC workspace instead of the module.

Checkout this guide [here](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables) which covers the various variable types supported and how to use them.


### Variable Sets
Certain variables are shared across all applications due to their similar use cases.

The system by which this is done on a workspace or global level is managed by [Variable Sets](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-multiple-variable-sets#:~:text=Terraform%20Cloud%20variable%20sets%20are,Input%20variables%20modify%20your%20configuration.)
> NOTE: Due to security concerns, variable sets are managed by admins on TFC only. If you need to create one, reach out to any of the DevOps Teams mentioned at the end of this document

At the time of this writing, the following types are managed by variable sets:
 - AWS credentials
 - `certiticate_arn`: This is the ARN of the certificate to be used based on domain wildcards.
 - `DD_API_KEY`: The DataDog API key
 - `DD_APP_KEY`: The DataDog Application key
 - `environment_shortname`: This is introduced to cater for long environment names that exceed character length specs on some resources eg NLBs have 32 char limits and `prod-shadow` is far too long so this is passed via this variable as `shadow` to save 5 characters for the service names which cannot be shortened

## Contributing

Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for details on how to contribute to this project.

## Best Practices

Please see the [Best Practices guide](https://www.terraform-best-practices.com/)
file for details on how to use this project.

## Which version should I use

Please, try to keep you modules always updated using the latest version. You
can find them on the [releases page](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/releases).

We keep creating new features and modules in the main branch. The last release
will be always like the main branch.

New versions will be released anytime a breaking change happens. So, be careful
when upgrading a major release and read the `CHANGELOG.md`.

There are old version branches which will publish in the old version as well.

If you need more information about developing modules, not using them, please
read the [contribution guide](./CONTRIBUTING.md).

## Team

Please reach out any DevOps teams on Slack:

- #team-slipway
- #team-kraken
- #team-sentinel
