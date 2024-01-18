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

