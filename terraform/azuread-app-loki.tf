resource "azuread_application" "loki" {
  display_name     = "Loki"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/loki.png")

  api {
    requested_access_token_version = "2"
  }

  identifier_uris = [
    "https://loki.${var.root_domain}"
  ]

  feature_tags {
    enterprise = false
    gallery    = false
  }
}

resource "azuread_application_permission_scope" "loki_push_logs" {
  application_id = azuread_application.loki.id
  scope_id       = "6392885d-cfa3-460c-95b9-e3782923baf3"
  value          = "push_logs"

  admin_consent_description  = "Push logs into Loki"
  admin_consent_display_name = "Push logs"
}
