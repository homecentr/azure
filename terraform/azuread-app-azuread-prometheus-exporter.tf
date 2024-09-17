resource "azuread_application" "azuread_prometheus_exporter" {
  display_name            = "Azure AD Prometheus Exporter"
  sign_in_audience        = "AzureADMyOrg"
  logo_image              = filebase64("../icons/azuread.png")
  group_membership_claims = ["ApplicationGroup"]

  api {
    requested_access_token_version = "2"
  }

  feature_tags {
    enterprise = true
    gallery    = false
  }
}

resource "azuread_service_principal" "azuread_prometheus_exporter" {
  client_id                    = azuread_application.azuread_prometheus_exporter.client_id
  app_role_assignment_required = false

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }
}

resource "azuread_app_role_assignment" "azuread_prometheus_exporter_application_read_all" {
  principal_object_id = azuread_service_principal.azuread_prometheus_exporter.object_id
  resource_object_id  = azuread_service_principal.msgraph.object_id
  app_role_id         = azuread_service_principal.msgraph.app_role_ids["Application.Read.All"]
}
 