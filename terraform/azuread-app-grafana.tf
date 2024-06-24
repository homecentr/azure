resource "azuread_application" "grafana" {
  display_name     = "Grafana"
  sign_in_audience = "AzureADMyOrg"

  web {
    redirect_uris = var.grafana_redirect_urls
  }

  required_resource_access {
    resource_app_id = data.azuread_application_published_app_ids.well_known.result.MicrosoftGraph

    # offline_access and openid scopes
    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["openid"]
      type = "Scope"
    }

    resource_access {
      id   = azuread_service_principal.msgraph.oauth2_permission_scope_ids["offline_access"]
      type = "Scope"
    }
  }

  optional_claims {
    access_token {
      name = "groups"
    }

    id_token {
      name = "groups"
    }

    saml2_token {
      name = "groups"
    }
  }

  group_membership_claims = ["SecurityGroup", "ApplicationGroup"]

  api {
    requested_access_token_version = "2"
  }

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_service_principal" "grafana" {
  client_id                    = azuread_application.grafana.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

# Application roles
resource "azuread_application_app_role" "grafana_viewer" {
  application_id = azuread_application.grafana.id
  role_id        = "fae263fa-06cf-4070-abad-05c469bd83ab"

  allowed_member_types = ["User"]
  description          = "Grafana Viewer"
  display_name         = "Grafana Viewer"
  value                = "Viewer"
}

resource "azuread_application_app_role" "grafana_editor" {
  application_id = azuread_application.grafana.id
  role_id        = "4733aaf8-b5a8-45a7-9efe-8b02e5a4c262"

  allowed_member_types = ["User"]
  description          = "Grafana Editor"
  display_name         = "Grafana Editor"
  value                = "Editor"
}

resource "azuread_application_app_role" "grafana_admin" {
  application_id = azuread_application.grafana.id
  role_id        = "d5b6881b-5fa2-4d7a-9aca-966f5a16623f"

  allowed_member_types = ["User"]
  description          = "Grafana Admin"
  display_name         = "Grafana Admin"
  value                = "Admin"
}

# Admin level consent for the required scopes
resource "azuread_service_principal_delegated_permission_grant" "grafana" {
  service_principal_object_id          = azuread_service_principal.grafana.object_id
  resource_service_principal_object_id = azuread_service_principal.msgraph.object_id
  claim_values                         = ["openid", "offline_access"]
}

# Assign the Admin app role to the Administrators group
resource "azuread_app_role_assignment" "grafana_administrators" {
  app_role_id         = azuread_application_app_role.grafana_admin.role_id
  principal_object_id = azuread_group.administrators.object_id
  resource_object_id  = azuread_service_principal.grafana.object_id
}

# Assign the Viewer app role to the Users group
resource "azuread_app_role_assignment" "grafana_users" {
  app_role_id         = azuread_application_app_role.grafana_viewer.role_id
  principal_object_id = azuread_group.users.object_id
  resource_object_id  = azuread_service_principal.grafana.object_id
}
