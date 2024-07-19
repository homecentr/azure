resource "azuread_application" "loki_client" {
  display_name     = "Loki Client"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/loki.png")

  api {
    requested_access_token_version = "2"
  }

  identifier_uris = [ 
    "https://loki-client.${var.root_domain}"
   ]

  required_resource_access {
    resource_app_id = azuread_application.loki.object_id

    resource_access {
      id   = azuread_application_permission_scope.loki_push_logs.scope_id
      type = "Scope"
    }
  }

  feature_tags {
    enterprise = false
    gallery    = false
  }
}

resource "azuread_service_principal" "loki_client" {
  client_id                    = azuread_application.loki_client.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

# Admin level consent for the required scopes
resource "azuread_service_principal_delegated_permission_grant" "loki_client" {
  service_principal_object_id          = azuread_service_principal.loki_client.object_id
  resource_service_principal_object_id = azuread_service_principal.msgraph.object_id
  
  claim_values = [
    azuread_application_permission_scope.loki_push_logs.value
  ]
}
