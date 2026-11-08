locals {
  service_domain_list = split(".", var.service_domain)
}

data "aws_route53_zone" "domain" {
  name = "${join(".", slice(local.service_domain_list, var.domain_index_route53, length(local.service_domain_list)))}."
}

data "aws_caller_identity" "current" {}
data "aws_elb_service_account" "main" {}


data "terraform_remote_state" "networking" {
  backend = "remote"
  config = {
    organization = "<your-tfc-org>"
    workspaces = {
      name = "cbh-networking-${var.networking_workspace != "" ? var.networking_workspace : var.workspace}"
    }
  }
}
