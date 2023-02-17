resource "azuread_application" "cloudflare" {
  display_name            = "Cloudflare Access${var.display_name_environment_suffix}"
  sign_in_audience        = "AzureADMyOrg"
  group_membership_claims = ["ApplicationGroup"]

  web {
    redirect_uris = [
        "https://${data.sops_file.secrets.data["cloudflare_team_name"]}.cloudflareaccess.com/cdn-cgi/access/callback"
    ]
  }

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["email"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["offline_access"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["openid"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["profile"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["User.Read"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["Directory.Read.All"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["GroupMember.Read.All"]
      type = "Scope"
    }
  }

  api {
    requested_access_token_version = "2"
  }

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_application_password" "cloudflare" {
  application_object_id = azuread_application.cloudflare.object_id
  end_date_relative     = "17280h"
}

resource "azuread_service_principal" "cloudflare" {
  application_id               = azuread_application.cloudflare.application_id
  app_role_assignment_required = false

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

# Admin level consent for the required scopes
resource "azuread_service_principal_delegated_permission_grant" "cloudflare" {
  service_principal_object_id          = azuread_service_principal.cloudflare.object_id
  resource_service_principal_object_id = azuread_service_principal.msgraph.object_id
  claim_values                         = ["email", "openid", "offline_access", "profile"]
}

# Assign the app to the Administrators group
resource "azuread_app_role_assignment" "cloudflare_administrators" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.administrators.object_id
  resource_object_id  = azuread_service_principal.cloudflare.object_id
}
