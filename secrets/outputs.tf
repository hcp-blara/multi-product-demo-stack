output "hcp_client_id" {
  value = data.vault_kv_secret_v2.hashistack.data["hcp_client_id"]
}

output "hcp_client_secret" {
  value = data.vault_kv_secret_v2.hashistack.data["hcp_client_secret"]
}

output "tfe_token" {
  value = data.vault_kv_secret_v2.hashistack.data["tfe_token"]
}

output "boundary_admin_password" {
  value = data.vault_kv_secret_v2.hashistack.data["boundary_admin_password"]
}
