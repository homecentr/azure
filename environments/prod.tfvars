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

argocd_redirect_urls = [
  "https://argocd.homecentr.one/auth/callback"
]

cloudflare_ssh_hosts = [
  { hostname = "pve1" },
  { hostname = "pve2" },
  { hostname = "pve3" }
]

cloudflare_apps_subdomain_suffix = ""
cloudflare_apps_root_domain      = "homecentr.one"
