resource "azuread_application" "gatus" {
  display_name     = "Gatus"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/gatus.png")

  api {
    requested_access_token_version = "2"
  }

  identifier_uris = [
    "https://status.${var.root_domain}"
  ]

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_service_principal" "gatus" {
  client_id                    = azuread_application.gatus.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

# Healtchecker role to pomerium app
resource "azuread_app_role_assignment" "pomerium_gatus" {
  app_role_id         = azuread_application_app_role.pomerium_healthcheck.role_id # "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_service_principal.gatus.object_id
  resource_object_id  = azuread_service_principal.pomerium.object_id
}

# # Admin level consent for the required scopes
# resource "azuread_service_principal_delegated_permission_grant" "gatus" {
#   service_principal_object_id          = azuread_service_principal.gatus.object_id
#   resource_service_principal_object_id = azuread_service_principal.pomerium.object_id
#   claim_values = [
#     "healthcheck", ".default"
#   ]
# }
