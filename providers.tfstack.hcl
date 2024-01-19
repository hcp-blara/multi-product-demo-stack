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
  vault = {
    source = "hashicorp/vault"
    version = "~> 3.24.0"
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
      jwt  = file(var.vault_identity_token_file)
      role = var.vault_role
    }
  }
}

provider "hcp" "this" {
  config {
    client_id      = component.secrets.hcp_client_id
    client_secret  = component.secrets.hcp_client_secret
    project_id     = var.hcp_project_id
  }
}

provider "tfe" "this" {}
