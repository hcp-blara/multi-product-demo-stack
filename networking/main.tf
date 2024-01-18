terraform {
  required_providers {
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
}

data "vault_kv_secret_v2" "hcp_creds" {
  name  = "hcp"
  mount = "kv"
}

provider "hcp" {
  client_id = data.vault_kv_secret_v2.hcp_creds.data["client_id"]
  client_secret = data.vault_kv_secret_v2.hcp_creds.data["client_secret"]
  project_id = var.project_id
}

data "aws_availability_zones" "available" {
  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  azs                  = data.aws_availability_zones.available.names
  cidr                 = var.vpc_cidr_block
  enable_dns_hostnames = true
  name                 = "${var.stack_id}-vpc"
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
}

resource "hcp_hvn" "main" {
  hvn_id         = "${var.stack_id}-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = var.hvn_cidr_block
}

module "aws_hcp_network_config" {
  source  = "hashicorp/hcp-consul/aws"
  version = "~> 0.12.1"

  hvn             = hcp_hvn.main
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets
  route_table_ids = module.vpc.public_route_table_ids
}
