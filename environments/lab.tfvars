environment_name                = "lab"
display_name_environment_suffix = " (Lab)"

pomerium_redirect_urls = [
  "https://login.lab.homecentr.one/oauth2/callback"
]

proxmox_redirect_urls = [
  "https://10.1.8.11/",
  "https://10.1.8.12/",
  "https://10.1.8.13/",
  "https://pve.lab.homecentr.one/"
]

argocd_redirect_urls = [
  "https://argocd.lab.homecentr.one/auth/callback",
  "https://localhost:58000/auth/callback", # for testing via kube proxy
]

cloudflare_ssh_hosts = [
    { hostname = "pve1-lab" },
    { hostname = "pve2-lab" },
    { hostname = "pve3-lab" }
]

cloudflare_apps_subdomain_suffix = "-lab"
cloudflare_apps_root_domain      = "homecentr.one"
