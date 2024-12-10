resource "azuread_application" "argocd" {
  display_name     = "Argo CD"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/argocd.png")

  web {
    redirect_uris = [
      "https://argocd.${var.root_domain}/auth/callback"
    ]
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

  identifier_uris = [
    "https://argocd.${var.root_domain}"
  ]

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_service_principal" "argocd" {
  client_id                    = azuread_application.argocd.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}
