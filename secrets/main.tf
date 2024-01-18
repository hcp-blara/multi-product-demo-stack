data "vault_kv_secret_v2" "hcp_creds" {
  name  = "hcp"
  mount = "kv"
}
