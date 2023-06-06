resource "cloudflare_tunnel" "kubernetes" {
  account_id = data.sops_file.secrets.data["cloudflare_account_id"]
  name       = "Kubernetes${var.display_name_environment_suffix}"
  secret     = base64encode(data.sops_file.secrets.data["cloudflare_tunnel_secret"])
}