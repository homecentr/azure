data "azuread_application_template" "saml_toolkit" {
  display_name = "Microsoft Entra SAML Toolkit"
}

resource "azuread_application" "snipeit" {
  display_name     = "Snipe IT"
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("../icons/snipeit.png")
  template_id      = data.azuread_application_template.saml_toolkit.template_id

  web {
    redirect_uris = [
      "${var.snipeit_root_url}/saml/acs",
      "${var.snipeit_root_url}/login/saml"
    ]
  }

  optional_claims {
    saml2_token {
      essential = true
      name      = "NameID"
      source    = "user"
    }
  }

  api {
    requested_access_token_version = "2"
  }

  feature_tags {
    enterprise            = true
    gallery               = false
    custom_single_sign_on = true
  }

  identifier_uris = [var.snipeit_root_url]
}

resource "azuread_service_principal" "snipeit" {
  client_id                    = azuread_application.snipeit.client_id
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
resource "azuread_app_role_assignment" "snipeit_administrators" {
  app_role_id         = "00000000-0000-0000-0000-000000000000" # Default access
  principal_object_id = azuread_group.administrators.object_id
  resource_object_id  = azuread_service_principal.snipeit.object_id
}
