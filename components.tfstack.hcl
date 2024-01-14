variable "aws_account_id" {
  type = string
}

variable "stack_id" {
  type        = string
  description = "The name of your stack"
}

variable "region" {
  type        = string
  description = "The AWS and HCP region to create resources in"
}

required_providers {
  tfe = {
    version = "~> 0.49.0"
  }
  doormat = {
    source  = "doormat.hashicorp.services/hashicorp-security/doormat"
    version = "~> 0.0.6"
  }
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.8.0"
  }
  hcp = {
    source  = "hashicorp/hcp"
    version = "~> 0.66.0"
  }
}

provider "doormat" "this" {}

component "networking" {
  source = "./networking"

  inputs = {
    aws_account_id = var.aws_account_id
    region         = var.region
    stack_id       = var.stack_id
  }

  providers = {
    doormat = provider.doormat.this
  }
}

