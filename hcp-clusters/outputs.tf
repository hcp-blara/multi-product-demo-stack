output "consul_root_token" {
  value = hcp_consul_cluster_root_token.provider.secret_id
  sensitive = true
}

output "consul_ca_file" {
  value = hcp_consul_cluster.hashistack.consul_ca_file
  sensitive = true
}

output "consul_config_file" {
  value = hcp_consul_cluster.hashistack.consul_config_file
  sensitive = true
}

output "consul_public_endpoint" {
  value = hcp_consul_cluster.hashistack.consul_public_endpoint_url
}

output "boundary_public_endpoint" {
  value = hcp_boundary_cluster.hashistack.cluster_url
}
