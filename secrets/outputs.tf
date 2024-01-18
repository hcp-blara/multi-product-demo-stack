output "hcp_client_id" {
  value = data.vault_kv_secret_v2.hcp_creds.data["client_id"]
}

output "hcp_secret_id" {
  value = data.vault_kv_secret_v2.hcp_creds.data["client_secret"]
}
