environment_name = "prod"
root_domain = "homecentr.one"

pomerium_redirect_urls = [
  "https://login.homecentr.one/oauth2/callback"
]

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
    "https://docs.homecentr.one/login/1b25df86-74d1-48ae-bbff-4bedae784776/callback"
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

snipeit_root_url = "https://snipeit.homecentr.one"
nextcloud_root_url = "https://nextcloud.homecentr.one"

cloudflare_ssh_hosts = [
  { hostname = "pve1" },
  { hostname = "pve2" },
  { hostname = "pve3" },
  { hostname = "app-pbs" },
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
  { hostname = "app-immich" }
]

cloudflare_apps_subdomain_suffix     = ""
cloudflare_apps_root_domain          = "homecentr.one"
cloudflare_health_service_token_name = "6db2c43c-9434-48a2-8036-dcebbcc8dbfe"
