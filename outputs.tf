output "path" {
  value = local.path
}

output "policy_name" {
  value = vault_policy.this.name
}
