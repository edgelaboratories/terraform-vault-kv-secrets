variable "kv_path" {
  description = "Path where the secrets KV store is mounted."
  default     = "secrets"
}

variable "owner" {
  description = "Owner of the secrets."
  type        = string
}

variable "secrets" {
  description = "A mapping of key/value that will be saved in the secrets KV store."
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "capabilities" {
  description = <<EOT
List of permissions to attach to the policy.
See https://www.vaultproject.io/docs/concepts/policies#policies.
EOT
  type        = list(string)
  default     = ["read"]
}
