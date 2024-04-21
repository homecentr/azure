resource "cloudflare_access_policy" "service_token" {
  application_id = cloudflare_access_application.apps["Cloudflare Tunnel Healthcheck"].id
  account_id     = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name           = "Service Token${var.display_name_environment_suffix}"
  precedence     = "3"
  decision       = "non_identity"

  include {
    service_token = [var.cloudflare_health_service_token_name]
  }
}