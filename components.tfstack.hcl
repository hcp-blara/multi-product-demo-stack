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

variable "role_arn" {
  type = string
}

variable "identity_token_file" {
  type = string
}

required_providers {
  tfe = {
    source  = "hashicorp/tfe"
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
provider "hcp" "this" {}
provider "aws" "this" {
  config {
    region = var.region

    assume_role_with_web_identity {
      role_arn                = var.role_arn
      web_identity_token_file = var.identity_token_file
    }
  }
}

component "networking" {
  source = "./networking"

  inputs = {
    aws_account_id = var.aws_account_id
    region         = var.region
    stack_id       = var.stack_id
  }

  providers = {
    doormat = provider.doormat.this
    aws     = provider.aws.this
    hcp     = provider.hcp.this
  }
}

