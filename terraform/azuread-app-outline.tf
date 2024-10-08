resource "azuread_application" "outline" {
  display_name     = "Outline"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/gatus.png")

  api {
    requested_access_token_version = "2"
  }

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["email"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["profile"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["offline_access"]
      type = "Scope"
    }
  }

  web {
    redirect_uris = [
      "https://outline.${var.root_domain}/auth/oidc.callback"
    ]
  }

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_service_principal" "outline" {
  client_id                    = azuread_application.outline.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

# Admin level consent for the required scopes
resource "azuread_service_principal_delegated_permission_grant" "outline" {
  service_principal_object_id          = azuread_service_principal.outline.object_id
  resource_service_principal_object_id = azuread_service_principal.msgraph.object_id
  claim_values                         = ["email", "profile", "offline_access"]
}

# Assign the app to the Administrators group
resource "azuread_app_role_assignment" "outline_administrators" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.administrators.object_id
  resource_object_id  = azuread_service_principal.outline.object_id
}

# Assign the app to the Users group
resource "azuread_app_role_assignment" "outline_users" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.users.object_id
  resource_object_id  = azuread_service_principal.outline.object_id
}
