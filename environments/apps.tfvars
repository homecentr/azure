cloudflare_apps = [
  {
    subdomain           = "login"
    display_name        = "Login"
    allow_non_admins    = true,
    allow_service_token = false
  },
  {
    subdomain           = "pve"
    display_name        = "Proxmox VE"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pbs"
    display_name        = "Proxmox Backup Server"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pihole1"
    display_name        = "Pi-hole 1"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pihole2"
    display_name        = "Pi-hole 2"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "status"
    display_name        = "Gatus"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "grafana"
    display_name        = "Grafana"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "prometheus"
    display_name        = "Prometheus"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "unifi"
    display_name        = "Unifi Controller"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "docs"
    display_name        = "Docs"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "snipeit"
    display_name        = "Snipe IT"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "tunnel-health"
    display_name        = "Cloudflare Tunnel Healthcheck"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "homepage"
    display_name        = "Homepage"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "coder"
    display_name        = "Coder"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "speed"
    display_name        = "MySpeed"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "immich"
    display_name        = "Immich"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "nvr"
    display_name        = "Frigate"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "whatsupdocker"
    display_name        = "What's up Docker"
    allow_non_admins    = false,
    allow_service_token = true
  },
]
