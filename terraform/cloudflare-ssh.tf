resource "cloudflare_record" "ssh" {
  for_each = { for each in var.cloudflare_ssh_hosts : each.hostname => each }

  zone_id = sensitive(data.sops_file.secrets.data["cloudflare_zone_id"])
  name    = "${each.key}.${var.cloudflare_apps_root_domain}"
  type    = "CNAME"
  value   = cloudflare_tunnel.kubernetes.cname
  ttl     = 1
  proxied = true
}

resource "cloudflare_access_application" "ssh" {
  for_each = { for each in var.cloudflare_ssh_hosts : each.hostname => each }

  account_id                = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name                      = "SSH${var.display_name_environment_suffix} / ${each.key}.${var.cloudflare_apps_root_domain}"
  domain                    = "${each.key}.${var.cloudflare_apps_root_domain}"
  type                      = "self_hosted"
  session_duration          = "24h"
  auto_redirect_to_identity = true
  allowed_idps              = [cloudflare_access_identity_provider.azuread.id]
}

resource "cloudflare_access_policy" "ssh" {
  for_each = { for each in var.cloudflare_ssh_hosts : each.hostname => each }

  application_id = cloudflare_access_application.ssh[each.key].id
  account_id     = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name           = "AD Group${var.display_name_environment_suffix} / ${azuread_group.administrators.display_name}"
  precedence     = "1"
  decision       = "allow"

  include {
    azure {
      identity_provider_id = cloudflare_access_identity_provider.azuread.id

      id = [
        azuread_group.administrators.object_id
      ]
    }
  }
}
