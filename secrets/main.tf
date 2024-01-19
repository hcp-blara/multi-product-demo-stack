data "vault_kv_secret_v2" "hashistack" {
  name  = "hashistack"
  mount = "kv"
}
