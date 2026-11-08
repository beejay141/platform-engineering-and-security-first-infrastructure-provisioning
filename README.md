# Platform Engineering and Security-First Infrastructure Provisioning

**Reusable Terraform modules for provisioning secure, observable, production-grade AWS infrastructure at Clipboard Health**

[![CI](https://img.shields.io/badge/CI-fmt%20%2F%20validate%20%2F%20go%20vet-2088FF)](.github/workflows/ci.yml)
[![Terraform](https://img.shields.io/badge/terraform-%E2%89%A51.3-844FBA)](https://www.terraform.io/)
[![Tests](https://img.shields.io/badge/tests-terratest%20%2F%20go-00ADD8)](tests)

## Overview

This repository is the platform engineering foundation used by Clipboard Health's engineering
organization to provision and operate AWS and Datadog infrastructure through Terraform. It
provides a catalog of versioned, peer-reviewed, and automatically tested infrastructure
modules so that product teams can stand up compute, data, networking, and observability
resources that are **secure by default**, consistent across environments, and safe to change
through a controlled release process.

The project demonstrates end-to-end platform engineering ownership: module design,
security-first defaults, infrastructure testing, and governance for a multi-team
organization — work submitted as supporting evidence for an EB-2 petition in the area of
**Platform Engineering and Security-First Infrastructure Provisioning**.

## Key Engineering Contributions

- **Security-first infrastructure defaults** — Every module provisions least-privilege IAM
  roles and policies (for example the [ECS execution/task roles](modules/aws/ecs-apps/main.tf)),
  network-scoped security groups that restrict ingress to the VPC CIDR rather than the public
  internet (see [`rds/security.tf`](modules/aws/rds/security.tf) and
  [`elasticache/security.tf`](modules/aws/elasticache/security.tf)), encryption at rest for
  managed databases (`storage_encrypted` in [`rds/main.tf`](modules/aws/rds/main.tf)),
  randomly generated and SSM Parameter Store–backed credentials instead of hard-coded secrets,
  and blocked public access on S3 buckets used for load balancer access logs.
- **Observability and reliability engineering** — First-class Datadog modules
  ([`monitor`](modules/datadog/monitor), [`slo`](modules/datadog/slo),
  [`synthetic_hc`](modules/datadog/synthetic_hc)) are composed directly into application and
  data modules (see [`ecs-apps/monitor.tf`](modules/aws/ecs-apps/monitor.tf),
  [`ecs-apps/slo.tf`](modules/aws/ecs-apps/slo.tf), and
  [`rds/monitoring.tf`](modules/aws/rds/monitoring.tf)) so that every provisioned service ships
  with alerting and SLO tracking rather than bolting monitoring on after the fact.
  Infrastructure-as-code for Datadog monitors keeps alerting, ownership, and paging
  configuration in version control alongside the resources they observe.
- **Automated infrastructure testing** — Each AWS and Datadog module has a corresponding
  [Terratest](https://terratest.gruntwork.io/) suite written in Go (see [`tests/`](tests)) that
  provisions real resources, asserts on their configuration, and tears them down, catching
  regressions before they reach shared environments.
- **Dependency-free CI validation** — A single [GitHub Actions workflow](.github/workflows/ci.yml)
  runs `terraform fmt -check`, `terraform init -backend=false`/`validate` for every module that
  only depends on public providers, and `go vet`/`go build`/compile-only `go test` for the
  Terratest suites — all without requiring any cloud credentials, Terraform Cloud token, or
  real AWS/Datadog resources, so the pipeline runs cleanly in any fork.
- **Governed, multi-team module design** — Clear module boundaries (compute, data, caching,
  streaming, and observability), documented inputs/outputs ([`terraform-docs`](terraform-docs.tmpl)
  generated READMEs), and a contribution process ([`CONTRIBUTING.md`](CONTRIBUTING.md)) allow
  multiple teams to safely consume and extend shared infrastructure without duplicating
  security or operational logic.

## Architecture

The modules are organized in a monorepo directory structure that mirrors how infrastructure
is consumed: provider-scoped module namespaces (`aws`, `datadog`), runnable examples, and a
parallel Go-based test suite.

```shell
├── examples
│   └── datadog
│       ├── monitor         # Example usage of the Datadog monitor module
│       └── slo              # Example usage of the Datadog SLO module
├── modules
│   ├── aws
│   │   ├── ecs-apps          # ECS service, ALB, CodeDeploy, IAM, monitoring, SLOs
│   │   ├── elasticache        # Redis/ElastiCache with VPC-scoped security groups
│   │   ├── kinesis             # Kinesis data streams
│   │   └── rds                  # Aurora/RDS clusters with encryption, secrets, monitoring
│   └── datadog
│       ├── monitor            # Reusable Datadog monitor abstraction
│       ├── slo                 # Reusable Datadog SLO abstraction
│       └── synthetic_hc       # Synthetic health-check monitors
├── scripts
│   └── validate.sh            # Per-module terraform fmt/validate used locally and in CI
├── tests                        # Terratest (Go) suites, one per module
└── .github/workflows           # CI: terraform fmt/validate + go vet/build (no secrets)
```

See each module's `README.md` (generated with
[`terraform-docs`](terraform-docs.tmpl)) for its full input/output reference:
[`aws/ecs-apps`](modules/aws/ecs-apps/README.md), [`aws/elasticache`](modules/aws/elasticache/README.md),
[`aws/kinesis`](modules/aws/kinesis/README.md), [`aws/rds`](modules/aws/rds/README.md),
[`datadog/monitor`](modules/datadog/monitor/README.md), [`datadog/slo`](modules/datadog/slo/README.md),
and [`datadog/synthetic_hc`](modules/datadog/synthetic_hc/README.md).

## Variables and Variable Sets

These modules are built to integrate with Terraform Cloud remote variables as a means to
secure and manage variables used in the application.

Therefore, unless a variable is certain to never change, opt to define variables in the TFC
workspace instead of the module.

See this guide on [Terraform Cloud workspace variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables),
which covers the various variable types supported and how to use them.

### Variable Sets

Certain variables are shared across all applications due to their similar use cases.

This is managed on a workspace or global level through
[Variable Sets](https://developer.hashicorp.com/terraform/tutorials/cloud/cloud-multiple-variable-sets#:~:text=Terraform%20Cloud%20variable%20sets%20are,Input%20variables%20modify%20your%20configuration.).

> **Note:** For security reasons, variable sets are managed by admins on TFC only. If you need
> to create one, reach out to any of the DevOps teams listed below.

At the time of this writing, the following types are managed by variable sets:

- AWS credentials
- `certificate_arn`: The ARN of the certificate to be used based on domain wildcards.
- `DD_API_KEY`: The Datadog API key.
- `DD_APP_KEY`: The Datadog Application key.
- `environment_shortname`: Introduced to cater for long environment names that exceed
  character-length specs on some resources (e.g., NLBs have a 32-character limit, and
  `prod-shadow` is too long), so this is passed as `shadow` to save characters for the service
  names, which cannot be shortened.

## Testing

Every module ships with a matching [Terratest](https://terratest.gruntwork.io/) suite in
[`tests/`](tests) that, when run manually with real cloud credentials, provisions the
module's actual resources, verifies configuration and security properties, and destroys them
afterward:

```shell
go test -v tests/<provider>/<module>_test.go -timeout 30m
```

### Continuous Integration

The [`ci.yml`](.github/workflows/ci.yml) GitHub Actions workflow runs on every pull request and
push to `main` and performs only dependency-free static checks — no secrets, Terraform Cloud
token, or real AWS/Datadog infrastructure are used or required:

- `terraform fmt -check -recursive` across the whole repository.
- `terraform init -backend=false` + `terraform validate` for every module that only depends on
  public Terraform providers (`modules/aws/elasticache`, `modules/aws/kinesis`,
  `modules/aws/rds`, and the `modules/datadog/*` modules). `modules/aws/ecs-apps` and the
  `examples/` configs source submodules from a private Terraform Cloud module registry and can
  only be fmt-checked without a `TERRAFORM_CLOUD_TOKEN`.
- `go vet`, `go build`, and a compile-only `go test -run '^$'` for the Go test suites, which
  compiles every Terratest file without executing it (so no infrastructure is created).

Locally, [`scripts/validate.sh`](scripts/validate.sh) runs the same `terraform fmt`/`validate`
checks for any module touched by the current branch's diff.

## Contributing

Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for details on how to contribute to this
project.

## Best Practices

Please see the [Best Practices guide](https://www.terraform-best-practices.com/) for details
on how to use this project.

## Which Version Should I Use

Always try to keep your modules updated using the latest version. You can find them on the
[releases page](https://github.com/ClipboardHealth/terraform-clipboardstaffing-modules/releases).

New features and modules are continually added to the `main` branch. Releases and
[`CHANGELOG.md`](CHANGELOG.md) entries for this repository are currently cut and maintained
manually rather than through an automated release pipeline; be careful when upgrading a major
version and review the changelog before doing so.

If you need more information about developing modules rather than using them, please read the
[contribution guide](CONTRIBUTING.md).
