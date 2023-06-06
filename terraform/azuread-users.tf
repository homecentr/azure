data "azuread_user" "admin" {
  user_principal_name = data.sops_file.secrets.data["admin_user_principal_name"]
}

data "azuread_user" "e2e_admin" {
  user_principal_name = data.sops_file.secrets.data["e2e_admin_user_principal_name"]
}

data "azuread_user" "e2e_nonadmin_user" {
  user_principal_name = data.sops_file.secrets.data["e2e_nonadmin_user_principal_name"]
}
