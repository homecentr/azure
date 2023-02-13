data "azuread_user" "admin" {
  user_principal_name = data.sops_file.secrets.data["admin_user_principal_name"]
}
