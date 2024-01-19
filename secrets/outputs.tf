output "hcp_client_id" {
  value = data.vault_kv_secret_v2.hashistack.data["hcp_client_id"]
  sensitive = true
}

output "hcp_client_secret" {
  value = data.vault_kv_secret_v2.hashistack.data["hcp_client_secret"]
  sensitive = true
}

output "tfe_token" {
  value = data.vault_kv_secret_v2.hashistack.data["tfe_token"]
  sensitive = true
}

output "boundary_admin_password" {
  value = data.vault_kv_secret_v2.hashistack.data["boundary_admin_password"]
  sensitive = true
}
