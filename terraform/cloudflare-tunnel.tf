resource "cloudflare_tunnel" "default" {
  account_id = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name       = "Homecentr"
  secret     = sensitive(base64encode(data.sops_file.secrets.data["cloudflare_tunnel_secret"]))
  config_src = "local"
}

resource "cloudflare_tunnel" "backup" {
  account_id = sensitive(data.sops_file.secrets.data["cloudflare_account_id"])
  name       = "Homecentr / Backup"
  secret     = sensitive(base64encode(data.sops_file.secrets.data["cloudflare_tunnel_backup_secret"]))
  config_src = "local"
}
