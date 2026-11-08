terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.12.0"
    }
  }
}
