# Contributing to the project

Hey there, first of all, thank you for contributing to this project.

To start contributing here, we encourage you to identify changes that can help improve this project and help the organization as a whole, and all contributions are readily appreciated. I hope
you enjoy and help us to make this ecosystem even better for everyone.

## Table Of Contents

- [Contributing to the project](#contributing-to-the-project)
  - [Table Of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Making your own terraform repository](#making-your-own-terraform-repository)
    - [Boostrap the repository](#bootstrap-the-repository)
    - [Add your repository to the terraform registry](#add-your-repository-to-the-terraform-registry)
  - [Getting Started](#getting-started)
  - [Things to Note](#things-to-note)
  - [Testing](#testing)
    - [Prerequisites](#prerequisites)
  - [How to Generate Documentation](#how-to-generate-documentation)
  - [How to Create Tests](#how-to-create-tests)
  - [How to create Examples](#how-to-create-examples)
  - [Versioning](#versioning)
    - [Breaking changes](#breaking-changes)
    - [Scope](#scope)
  - [More information](#more-information)

## Introduction

Congrats on your first step to contributing to the terraform modules repository.

The aim of this project is to simplify terraform code across the organization and this is done through the aid of terraform modules.

Terraform modules allow us to wrap similar terraform code into single package that can be deployed in all applications.

Variables allow the operator to configure what the resources are and how they are named and structured.

```hcl
# This creates an ECS application and underlying services that support its operation like load balancers etc
module "services" {
  source                   = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/aws/ecs-apps"
  version                  = "4.4.0"
  workspace                = local.workspace
  service                  = "cbh-test"
  region                   = "us-west-2"
  service_domain           = "test.development.clipboardhealth.org"
  min_capacity             = 1
  max_capacity             = 1
  health_check_route       = "/health_check"
  environment_shortname    = local.workspace
  task_definition          = file("${path.module}/test_task_definition.json")
  alertchannel             = "@slack-devoce-alerts"
  slo_enabled              = true
  slo_next_js_enabled      = true
  monitor_enabled          = true
  certificate_arn          = "arn:aws:acm:us-west-2:977320448514:certificate/83364a20-0e72-492d-b0a2-1d948d19b302"
  iam_ecs_execution_role   = file("${path.module}/policies/ecs-assume-role.json")
  iam_ecs_execution_policy = file("${path.module}/policies/ecs-execution-policy.json")
  iam_ecs_task_role        = file("${path.module}/policies/ecs-task-assume-role.json")
  iam_ecs_task_policy      = file("${path.module}/policies/ecs-task-policy.json")
}
```

## Making your own terraform module
Terraform modules are imported via the module path as the source and the tags
define the version that will be used in the terraform application.

```hcl
  source  = "app.terraform.io/<your-tfc-org>/modules/<your-module-repo>//modules/aws/ecs-apps"
  version = "4.4.0"
```

This guide will outline all the steps to create a module in a repository different from this one where the guide is documented.

> NOTE: We advise teams who wish to create modules to do so in a new repository.

### Bootstrap the repository
To get started, there are some steps to boostrap the repository so all the steps later outlined work just fine.

For creating another terraform repository, you will:

1. Proceed to create an empty git repository.
```bash
hub create <repository-name>
```
2. Copy the following files from this repository into your repository
- CONTRIBUTING.md
- terraform-docs.tmpl
- pre-commit-config.yaml
- .gitignore
- scripts/
- .github/
- Makefile
- commitlint.config.js
  These files are at the core of the functional CI and development process which will allow you run all the steps already outlined in this guide
3. Create a modules folder to store your terraform code
```bash
mkdir modules
```
4. Create a tests folder and implement the Terraform module
```bash
mkdir tests
```
5. (Optional) Create tests using Terratest for the project
- Sample code for this can be found [here](./tests/aws/) and check the Golang files present there for samples.
6. (Optional) Create an examples folder to show users how to configure different module samples
7. Push the repository and confirm the pipelines are functional

### Add your repository to the terraform registry
Once all these steps are concluded, kindly contact #team-slipway or #team-kraken for administrators to add your repository
to the terraform registry after which all existing tags will be imported and the
project will be available for use in different terraform services.


### Creating your first module
To get started with creating your own module, kindly follow the steps linked below to setup a simple module example:

- [Install](https://pre-commit.com/#install) `pre-commit` application in your machine
- Git clone this repository
- Run `make` to install git hooks
- Create your branch for your contribution
- Add the name of the module under the provider you want to contribute. For example, if you want to create an EKS cluster in AWS. You need to:
  - add the module name: `eks` under the [AWS](./modules/aws) section
  - Create a `main.tf`, `variables.tf`, `outputs.tf` etc. files in the `eks` folder


### Outputs
Outputs are terraform structures that allows the operator to export data from resources created in the terraform.

This could be for documentation reasons or as a way to share the information to another terraform resource outside the project.

As part of this procedure of ensuring that module resources have information that should be shared, there should be outputs (within the `outputs.tf` file) defined in the module
to assist with exposing these values to the consumer of the resources.

Documentation on defining outputs can be found [here](https://developer.hashicorp.com/terraform/language/values/outputs#:~:text=sensitive%20%E2%80%94%20Suppressing%20Values%20in%20CLI%20Output&text=Terraform%20will%20hide%20values%20marked,use%20in%20a%20resource%20attribute.)

As we pass these outputs to the console as part of every `terraform apply`, it is necessary to also apply caution when exposing passwords and other sensitive information in the outputs without obfuscation.

You can mark a terraform output sensitive by using the `sensitive` flag and marking it as true to ensure they are hashed out in the console.
```
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}
```

To ensure pre-resource validation, you can also apply pre-condition checks to ensure user values do not cause unexpected resource creations that would fail on an apply.
eg ecs-apps must have an NLB name less than 32
```
output "api_base_url" {
  value = "https://${aws_lb.main.dns_name}/"

  precondition {
    condition     = len(aws_lb.main.name) > 31
    error_message = "ELB name cannot be greater than 32 characters"
  }
}
```

## Things to Note

Once you start contributions to this repository, here are a couple things to consider on your first PR:

- Consider that breaking changes upgrade the major version of the project and have to planned ahead of the change.
- Providers should not be present in the modules, since this will make impossible to use `for_each`, `count` and `depends_on`. See more in the [official documentation](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
- Run `make` to install git hooks and validate your commits.
- Documentation should be created and regularly updated using `terraform-docs`

## Testing

### Prerequisites

After making your contributions, tests are required to ensure that they pass all our **safety** checks.

For this, you require the following tools:

- [Terraform](https://www.terraform.io/)
- [Golang v1.15 or Higher](https://golang.org/)


Once you have them configured, you can run the following command for the go tests:

```shell
go test -v ./...
```

## How to Generate Documentation

When you are ready to generate the documentation for your module, follow the steps below:

- Create a `.terraform-docs.yaml` file inside your module directory
- Copy the content from [Terraform docs templates](terraform-docs.tmpl) into the `.terraform-docs.yaml`
- Edit the `.terraform-docs.yaml` file to suit your module
- Run the following command in your module directory:

```shell
terraform-docs markdown . --output-file README.md
```

**NB** Always run the command in the module directory when you update your
terraform module.

## How to Create Tests

- Please create a `module_test.go` file in the [tests](tests) directory. For example, if you want to create a test cases for the `eks` module, you need to an `eks_test.go` file in the [aws](tests/aws) directory.
- Checkout the [Terratest](https://terratest.gruntwork.io/) on how to create tests
- Ensure your tests are passing, if not the PR will be rejected.

## How to create Examples

- Please create the module examples in the [examples](examples) directory. For example, if you want to create an example for the `eks` module, you need to an `eks` folder in the [aws](examples/aws) directory.
- Create a `main.tf`, `variables.tf`, `outputs.tf` etc. files in the `eks` folder
- Add your examples and add a documentation on how to run them.

## Versioning

For this repository, [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/#specification)
specifications are used in enforcing commit messages.

This means the commit and PR titles must contain the following structural elements in communicating the level of the contribution:

1. `fix:` a commit of the type fix patches a bug in your codebase (this correlates with `PATCH` in Semantic Versioning).
2. `feat:` a commit of the type feat introduces a new feature to the codebase (this correlates with `MINOR` in Semantic Versioning).
3. `BREAKING CHANGE:` a commit that has a footer `BREAKING CHANGE:`, introduces a breaking API change (correlating with `MAJOR` in Semantic Versioning). A `BREAKING CHANGE` can be part of commits of **any** type.
4. types other than `fix:` and `feat:` are allowed: `build:`, `chore:` , `ci:`, `docs:`, `feat:`, `fix:`, `perf:`, `refactor:`, `revert:`, `style:`, `test:`.
5. footers other than `BREAKING CHANGE: <description>` may be provided and follow a convention similar to git trailer format.

> The above text was copied from the [official conventional commit](https://www.conventionalcommits.org/en/v1.0.0/) page

### Breaking changes

> NOTE: This section is super important so kindly read this carefully.

The major version of the module is not updated every time a change is made but only when a breaking change is
implemented.

As such, there are non-obvious criteria to consider when making a breaking change:

- The module changed the way variables are passed in or accessed
- Any new releases on top of your change require the modification of all existing consumers of that module
  - Variable addition that is not provided with defaults
    - These require the services to provide unique instances of them and therefore must be communicated/planned with the service teams owning them
    - Exceptions to this are variables that can be on-boarded to variable sets on a per-environment or global basis
- Major infrastructure changes based on the plan

If your changes meets any criteria, please add in your commit the breaking
change footer. This can be done by following the [conventional commit](https://www.conventionalcommits.org/en/v1.0.0/#specification) specifications.

In your commit you MUST include a footer with this format:

```text
BREAKING CHANGE: <single line reason why it's a breaking change>
```

> **IMPORTANT**: the `:` followed by a space and the single line message are
> mandatory, or you will not see the versioning bumping correctly.

Example of a well written breaking change commit:

```text
feat(ecs-apps): using raw var value instead of maps

In the past, variables were passed as a map with the value for the environment.
This is not allowed anymore and environment-related code are forbidden in the
terraform modules code.

BREAKING CHANGE: modules must not give environmental map values anymore
```

If any commits in your PR has this footer, the major version will be upgraded.
The releasing job will automatically create a new branch with the old version,
so any fixes in the old version can be made directly to that branch and we can
keep the development as usual in the previous version without breaking the
delivery in any service.

### Scope

In your commits, put the module you are working on in the scope of the message.

Example:

```text
fix(ecs-apps): typo in the variable xxx
```

> `ecs-apps` is the module name.

## More information

If you need any help, please send a message in any of those Slack channels:

- #team-slipway
- #team-kraken
- #team-sentinel
