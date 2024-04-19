environment_name                = "prod"
display_name_environment_suffix = ""

pomerium_redirect_urls = [
  "https://login.homecentr.one/oauth2/callback"
]

proxmox_redirect_urls = [
  "https://pve.homecentr.one/",
  "https://pve1.homecentr.one/",
  "https://pve2.homecentr.one/",
  "https://pve3.homecentr.one/",
]

cloudflare_ssh_hosts = [
  { hostname = "pve1" },
  { hostname = "pve2" },
  { hostname = "pve3" }
]

cloudflare_apps_subdomain_suffix = ""
cloudflare_apps_root_domain      = "homecentr.one"
cloudflare_health_service_token_name = "404786299123d60f30b949c7913b0aad.access"