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
    vpc_cidr_block = "10.1.0.0/16"
    vpc_public_subnets = [
      "10.1.1.0/24",
      "10.1.2.0/24",
      "10.1.3.0/24"
    ]
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

component "boundary-config" {
  source = "./boundary-config"

  inputs = {
    region = var.region
    my_email = var.my_email
    vault_public_endpoint = var.vault_address
  }

  providers = {
    boundary = provider.boundary.this
    aws = provider.aws.this
    time = provider.time.this
    vault = provider.vault.this
  }
}
