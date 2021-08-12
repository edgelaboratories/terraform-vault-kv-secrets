# terraform-vault-kv-secrets

Store secrets in a Vault KV secret store and generate a policy to access them.

## How to use

In your Terraform file, instanciate the module with:

```hcl
module "droopy_secrets" {
  source = "git@github.com:edgelaboratories/terraform-vault-kv-secrets.git?ref=v0.1.0"

  owner = "droopy"
  secrets = {
    "foo" = "hello"
    "bar" = "world"
  }
}
```

This will store secrets under `secrets/droopy` and generate a policy that allows to read them.

### Options

#### Specific policy

By default, the policy will allow to read the secrets. If specific capabilities must be set, simply list them. E.g.

```hcl
module "droopy_secrets" {
  ...
  capabilities = ["read", "update"]
}
```

#### KV store mount path

If the KV store is not mounted on the path `secrets`, use the `kv_path` variable to change it. E.g.

```hcl
module "droopy_secrets" {
  ...
  kv_path = "secrets-2"
}
```

### Outputs

- `path` -- the path where secrets are stored;
- `policy_name` -- the name of the generated Vault policy.
