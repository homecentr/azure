resource "cloudflare_tunnel" "kubernetes" {
  account_id = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name       = "Kubernetes${var.display_name_environment_suffix}"
  secret     = sensitive(base64encode(data.sops_file.secrets.data["cloudflare_tunnel_secret"]))
}