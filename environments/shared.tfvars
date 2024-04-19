cloudflare_apps = [
  {
    subdomain        = "homepage"
    display_name     = "Homepage"
    allow_non_admins = true
  },
  {
    subdomain        = "login"
    display_name     = "Login"
    allow_non_admins = true
  },
  {
    subdomain        = "pve"
    display_name     = "Proxmox VE"
    allow_non_admins = false
  },
  {
    subdomain        = "status"
    display_name     = "Gatus"
    allow_non_admins = true
  },
  {
    subdomain        = "pihole"
    display_name     = "Pi-hole"
    allow_non_admins = false
  },
]
