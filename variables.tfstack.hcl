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

variable "vault_namespace" {
  type = string
}

variable "vault_identity_token_file" {
  type = string
}

variable "vault_role" {
  type = string
}

variable "vault_address" {
  type = string
}

variable "tfc_organization" {
  type = string
}

variable "boundary_admin_user" {
  type = string
  default = "admin"
}

variable "my_email" {
  type = string
}
