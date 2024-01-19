output "hcp_client_id" {
  value = data.vault_kv_secret_v2.hcp_creds.data["client_id"]
  sensitive = true
}

output "hcp_client_secret" {
  value = data.vault_kv_secret_v2.hcp_creds.data["client_secret"]
  sensitive = true
}
