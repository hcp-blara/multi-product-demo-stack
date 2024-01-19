output "hcp_client_id" {
  value = nonsensitive(data.vault_kv_secret_v2.hashistack.data["hcp_client_id"])
}

output "hcp_client_secret" {
  value = nonsensitive(data.vault_kv_secret_v2.hashistack.data["hcp_client_secret"])
}

output "tfe_token" {
  value = nonsensitive(data.vault_kv_secret_v2.hashistack.data["tfe_token"])
}

output "boundary_admin_password" {
  value = nonsensitive(data.vault_kv_secret_v2.hashistack.data["boundary_admin_password"])
}
