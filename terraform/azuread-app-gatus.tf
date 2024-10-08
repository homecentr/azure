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
