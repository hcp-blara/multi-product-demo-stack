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

variable "aws_identity_token_file" {
  type = string
}

variable "hcp_project_id" {
  type = string
}

required_providers {
  tfe = {
    source  = "hashicorp/tfe"
    version = "~> 0.49.0"
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

provider "aws" "this" {
  config {
    region = var.region

    assume_role_with_web_identity {
      role_arn                = var.role_arn
      web_identity_token_file = var.aws_identity_token_file
    }
  }
}

provider "vault" "this" {
  config {
    skip_child_token = true
    address          = var.vault_address
    namespace        = var.vault_namespace

    auth_login_jwt {
      jwt  = file(var.identity_token_file)
      role = var.vault_role
    }
  }
}

provider "hcp" "this" {
  client_id      = component.secrets.hcp_client_id
  client_secrets = component.secrets.hcp_client_secret
}

component "secrets" {
  source = "./secrets"

  inputs = {}

  providers = {
    hcp = provider.hcp.this
  }
}

component "networking" {
  source = "./networking"

  inputs = {
    aws_account_id = var.aws_account_id
    region         = var.region
    stack_id       = var.stack_id
    project_id     = var.hcp_project_id
  }

  providers = {
    vault   = provider.vault.this
    aws     = provider.aws.this
  }
}

