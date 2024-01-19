component "secrets" {
  source = "./secrets"

  inputs = {}

  providers = {
    vault = provider.vault.this
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
    hcp     = provider.hcp.this
  }
}

component "hcp_clusters" {
  source = "./hcp-clusters"

  inputs = {
    boundary_admin_password = component.secrets.boundary_admin_password
    stack_id                = var.stack_id
    hvn_id                  = component.networking.hvn_id
    tfc_organization        = var.tfc_organization
  }

  providers = {
    hcp     = provider.hcp.this
  }
}

