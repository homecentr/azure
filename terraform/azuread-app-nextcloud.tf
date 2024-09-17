resource "azuread_application" "nextcloud" {
  display_name     = "Nextcloud"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/nextcloud.png")
  template_id      = data.azuread_application_template.saml_toolkit.template_id

  web {
    redirect_uris = [
      "${var.nextcloud_root_url}/login",
      "${var.nextcloud_root_url}/apps/user_saml/saml/acs",
      "${var.nextcloud_root_url}/",
    ]
  }

  api {
    requested_access_token_version = "2"
  }

  feature_tags {
    enterprise            = true
    gallery               = false
    custom_single_sign_on = true
  }

  identifier_uris = ["${var.nextcloud_root_url}/apps/user_saml/saml/metadata"]
}

resource "azuread_service_principal" "nextcloud" {
  client_id                    = azuread_application.nextcloud.client_id
  app_role_assignment_required = true

  owners = [
    data.azuread_user.admin.object_id
  ]

  feature_tags {
    enterprise = true
  }

  preferred_single_sign_on_mode = "saml"
}

# Assign the app to the Administrators group
resource "azuread_app_role_assignment" "nextcloud_users" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.users.object_id
  resource_object_id  = azuread_service_principal.nextcloud.object_id
}

resource "azuread_app_role_assignment" "nextcloud_administrators" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.administrators.object_id
  resource_object_id  = azuread_service_principal.nextcloud.object_id
}
