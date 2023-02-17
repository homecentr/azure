resource "cloudflare_record" "apps" {
  for_each = { for each in var.cloudflare_apps : each.display_name => each }

  zone_id = data.sops_file.secrets.data["cloudflare_zone_id"]
  name    = "${each.value.subdomain}${var.cloudflare_apps_subdomain_suffix}.${var.cloudflare_apps_root_domain}"
  type    = "CNAME"
  value   = cloudflare_tunnel.kubernetes.cname
  ttl     = 1
  proxied = true
}

resource "cloudflare_access_application" "apps" {
  for_each = { for each in var.cloudflare_apps : each.display_name => each }

  account_id                = data.sops_file.secrets.data["cloudflare_account_id"]
  name                      = "${each.value.display_name}${var.display_name_environment_suffix}"
  domain                    = "${each.value.subdomain}${var.cloudflare_apps_subdomain_suffix}.${var.cloudflare_apps_root_domain}"
  type                      = "self_hosted"
  session_duration          = "24h"
  auto_redirect_to_identity = true
  allowed_idps              = [cloudflare_access_identity_provider.azuread.id]
}

resource "cloudflare_access_policy" "apps_administrators" {
  for_each = { for each in var.cloudflare_apps : each.display_name => each }

  application_id = cloudflare_access_application.apps[each.key].id
  account_id     = data.sops_file.secrets.data["cloudflare_account_id"]
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

resource "cloudflare_access_policy" "apps_users" {
  for_each = { for each in var.cloudflare_apps : each.display_name => each if each.allow_non_admins == true }

  application_id = cloudflare_access_application.apps[each.key].id
  account_id     = data.sops_file.secrets.data["cloudflare_account_id"]
  name           = "AD Group${var.display_name_environment_suffix} / ${azuread_group.users.display_name}"
  precedence     = "3" # Temporary workaround
  decision       = "allow"

  include {
    azure {
      identity_provider_id = cloudflare_access_identity_provider.azuread.id

      id = [
        azuread_group.users.object_id
      ]
    }
  }
}
