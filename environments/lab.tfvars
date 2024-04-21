environment_name                = "lab"
display_name_environment_suffix = " (Lab)"

pomerium_redirect_urls = [
  "https://login-lab.homecentr.one/oauth2/callback"
]

proxmox_redirect_urls = [
  "https://10.1.8.11/",
  "https://10.1.8.12/",
  "https://10.1.8.13/",
  "https://pve-lab.homecentr.one/",
  "https://pve1-lab.homecentr.one/",
  "https://pve2-lab.homecentr.one/",
  "https://pve3-lab.homecentr.one/",

  "https://10.1.8.10/",
  "https://lab.homecentr.one/"
]

cloudflare_ssh_hosts = [
    { hostname = "pve1-lab" },
    { hostname = "pve2-lab" },
    { hostname = "pve3-lab" },
    { hostname = "lab" }
]

cloudflare_apps_subdomain_suffix = "-lab"
cloudflare_apps_root_domain      = "homecentr.one"
cloudflare_health_service_token_name = "503b3806-7f16-43a6-8c1f-4e62bc795395"