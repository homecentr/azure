data "sops_file" "secrets" {
  source_file = "../environments/secrets.${var.environment_name}.yml"
}
