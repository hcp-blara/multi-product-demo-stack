variable "stack_id" {
  type        = string
  description = "The name of your stack"
}

variable "region" {
  type        = string
  description = "The AWS and HCP region to create resources in"
}

variable "nomad_license" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vault_address" {
  type = string
}

variable "subnet_cidrs" {
  type = set()
}

variable "hvn_sg_id" {
  type = string
}

variable "consul_ca_file" {}
variable "consul_config_file" {}
variable "consul_root_token" {}
variable "subnet_ids" {}
