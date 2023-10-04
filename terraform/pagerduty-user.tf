resource "null_resource" "terraform-debug" {
  provisioner "local-exec" {
    command = "echo $VARIABLE1"

    environment = {
      VARIABLE1 = length(var.pagerduty_api_token)
    }
  }
}

data "pagerduty_user" "me" {
  email = sensitive(data.sops_file.secrets.data["pagerduty_user_email"])
}
