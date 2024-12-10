resource "azuread_application" "argocd" {
  display_name     = "Argo CD"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/argocd.png")

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
