identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

identity_token "vault" {
  audience = ["vault.workload.identity"]
}

deployment "example" {
  variables = {
    aws_account_id            = "567875439609"
    region                    = "us-east-1"
    stack_id                  = "tfstack"
    role_arn                  = "arn:aws:iam::567875439609:role/multi-product-demo-stack"
    aws_identity_token_file   = identity_token.aws.jwt_filename
    vault_identity_token_file = identity_token.vault.jwt_filename
    vault_namespace           = "admin"
    vault_role                = "tfc-role"
    vault_address             = "https://vault-dev-public-vault-557bd10a.9a7a158f.z1.hashicorp.cloud:8200"
    hcp_project_id            = "f26505f0-343d-48be-8503-89d7addf2310"
    tfc_organization          = "ben-lara-org"
    my_email = "ben.lara@hashicorp.com"
  }
}
