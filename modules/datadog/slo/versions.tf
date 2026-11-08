# Terraform 0.13+ uses the Terraform Registry:

terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.12.0"
    }
  }
}

