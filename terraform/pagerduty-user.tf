data "pagerduty_user" "me" {
  email = sensitive(data.sops_file.secrets.data["pagerduty_user_email"])
}
