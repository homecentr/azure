environment_name = "prod"
root_domain      = "homecentr.one"

proxmox_redirect_urls = [
  "https://pve.homecentr.one/",
  "https://pve1.homecentr.one/",
  "https://pve2.homecentr.one/",
  "https://pve3.homecentr.one/",
]

proxmox_backup_server_redirect_urls = [
  "https://pbs.homecentr.one/"
]

grafana_redirect_urls = [
  "https://grafana.homecentr.one/",
  "https://grafana.homecentr.one/login/generic_oauth"
]

wikijs_redirect_urls = [
  # "https://docs.homecentr.one/login/1b25df86-74d1-48ae-bbff-4bedae784776/callback",
  "https://docs.homecentr.one/login/16560089-1af1-490f-ab52-8c0fded45221/callback"
]

photoprism_redirect_urls = [
  "https://photos.homecentr.one/api/v1/oidc/redirect"
]

immich_redirect_urls = [
  "https://immich.homecentr.one/api/oauth/mobile-redirect",
  "https://immich.homecentr.one/auth/login",
  "https://immich.homecentr.one/user-settings"
]

whatsupdocker_redirect_urls = [
  "https://whatsupdocker.homecentr.one/auth/oidc/aad/cb"
]

oauth2proxy_redirect_urls = [
  "https://oauth.homecentr.one/oauth2/callback"
]

snipeit_root_url   = "https://snipeit.homecentr.one"
nextcloud_root_url = "https://nextcloud.homecentr.one"

cloudflare_ssh_hosts = [
  # Proxmox
  { hostname = "pve1" },
  { hostname = "pve2" },
  { hostname = "pve3" },

  # LXC
  { hostname = "backup" },
  { hostname = "app-pihole1" },
  { hostname = "app-pihole2" },
  { hostname = "app-cloudflared1" },
  { hostname = "app-cloudflared2" },
  { hostname = "app-mosquitto" },
  { hostname = "app-frigate" },
  { hostname = "app-haraka" },
  { hostname = "app-monitoring" },
  { hostname = "app-unifi-controller" },
  { hostname = "app-docs" },
  { hostname = "app-snipeit" },
  { hostname = "app-homepage" },
  { hostname = "app-autosnap" },
  { hostname = "app-myspeed" },
  { hostname = "app-immich" },
  { hostname = "app-traefik1" },
  { hostname = "app-traefik2" },
  { hostname = "app-traefik3" },
  { hostname = "app-outline" },

  # VM
  { hostname = "app-coder" }
]

cloudflare_apps_subdomain_suffix     = ""
cloudflare_apps_root_domain          = "homecentr.one"
cloudflare_health_service_token_name = "6db2c43c-9434-48a2-8036-dcebbcc8dbfe"

cloudflare_apps = [
  {
    subdomain           = "login"
    display_name        = "Login"
    allow_non_admins    = true,
    allow_service_token = false
  },
  {
    subdomain           = "oauth"
    display_name        = "OAuth"
    allow_non_admins    = true,
    allow_service_token = false
  },
  {
    subdomain           = "pve1"
    display_name        = "Proxmox VE (Node 1)"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pve2"
    display_name        = "Proxmox VE (Node 2)"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pve3"
    display_name        = "Proxmox VE (Node 3)"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "pve"
    display_name        = "Proxmox VE"
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
  {
    subdomain           = "home-assistant"
    display_name        = "Home Assistant"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "nextcloud-aio"
    display_name        = "Nextcloud AIO"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "nextcloud"
    display_name        = "Nextcloud"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "jellyfin"
    display_name        = "Jellyfin"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "jellyseerr"
    display_name        = "Jellyseerr"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "qbittorrent"
    display_name        = "qBittorrent"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "sonarr"
    display_name        = "Sonarr"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "radarr"
    display_name        = "Radarr"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "prowlarr"
    display_name        = "Prowlarr"
    allow_non_admins    = false,
    allow_service_token = true
  },
  {
    subdomain           = "outline"
    display_name        = "Outline"
    allow_non_admins    = true,
    allow_service_token = true
  },
  {
    subdomain           = "pbs"
    display_name        = "Proxmox Backup Server"
    allow_non_admins    = false,
    allow_service_token = true,
    tunnel              = "backup"
  },
  {
    subdomain           = "minio"
    display_name        = "MinIO"
    allow_non_admins    = false,
    allow_service_token = true,
    tunnel              = "backup"
  },
]
