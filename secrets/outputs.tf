output "hcp_client_id" {
  value = nonsensitive(data.vault_kv_secret_v2.hcp_creds.data["client_id"])
}

output "hcp_client_secret" {
  value = nonsensitive(data.vault_kv_secret_v2.hcp_creds.data["client_secret"])
}
