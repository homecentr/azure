environment_name                = "prod"

pomerium_redirect_urls = [
  "https://login.homecentr.one/oauth2/callback"
]

proxmox_redirect_urls = [
  "https://pve.homecentr.one/",
  "https://pve1.homecentr.one/",
  "https://pve2.homecentr.one/",
  "https://pve3.homecentr.one/",
]

grafana_redirect_urls = [
  "https://grafana.homecentr.one/",
  "https://grafana.homecentr.one/login/azuread"
]

cloudflare_ssh_hosts = [
  { hostname = "pve1" },
  { hostname = "pve2" },
  { hostname = "pve3" }
]

cloudflare_apps_subdomain_suffix = ""
cloudflare_apps_root_domain      = "homecentr.one"
cloudflare_health_service_token_name = "6db2c43c-9434-48a2-8036-dcebbcc8dbfe"