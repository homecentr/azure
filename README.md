# Cloud Resources

## Local set up
Working with this repository requires installation of several command line tools, please use the [dev-setup](https://github.com/lholota/dev-setup) repo and apply the playbook with following tags:
- sops
- terraform
- yubikey (optional)

## Cloudflare

### Local development

When developing locally, you need to create a Cloudflare API key and pass it using the `TF_VAR_cloudflare_api_key` variable.

## Azure AD

### Local development
When developing locally, use the command below to sign into Azure AD Homecentr Lab tenant:
```bash
az login --tenant 36f0d3ea-3ee5-40f5-849b-8c3630c9637b --allow-no-subscriptions
```

### Deployment credentials
1. Create an Azure Ad tenant
1. Create an app registration
   - Name: GitHub-Deployment
   - Type: Web
   - Create a secret
   - Assign the application the
1. Assign the application the `Application Administrator` Administrative role
1. Use the data from above to create a GitHub secret with following structure (put it on one line):
```json
{
    "client_id": "<tba>",
    "client_secret": "<tba>",
    "tenant_id": "<tba>"
}
```

### E2E Users

Users are created manually, follow the guide in the [e2e repository](https://github.com/homecentr/e2e).