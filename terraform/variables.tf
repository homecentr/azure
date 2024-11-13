variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "pagerduty_api_token" {
  type      = string
  sensitive = true
}

variable "root_domain" {
  type = string
}

variable "cloudflare_apps" {
  type = list(object({
    subdomain           = string
    display_name        = string
    allow_non_admins    = bool
    allow_service_token = bool
    tunnel = optional(string, "default")
  }))
}

variable "cloudflare_ssh_hosts" {
  type = list(object({
    hostname = string
  }))
}

variable "cloudflare_apps_subdomain_suffix" { type = string }
variable "cloudflare_apps_root_domain" { type = string }
variable "cloudflare_health_service_token_name" { type = string }

variable "environment_name" { type = string }

variable "aad_credentials" {
  type      = string
  sensitive = true
  default   = null
}

variable "proxmox_redirect_urls" { type = list(string) }
variable "proxmox_backup_server_redirect_urls" { type = list(string) }
variable "grafana_redirect_urls" { type = list(string) }
variable "wikijs_redirect_urls" { type = list(string) }
variable "photoprism_redirect_urls" { type = list(string) }
variable "immich_redirect_urls" { type = list(string) }
variable "whatsupdocker_redirect_urls" { type = list(string) }
variable "oauth2proxy_redirect_urls" { type = list(string) }

variable "snipeit_root_url" { type = string }
variable "nextcloud_root_url" { type = string }

locals {
  aad_credentials = var.aad_credentials != null ? (
    jsondecode(var.aad_credentials)
    ) : ({ # Locally az login should be used
      client_id     = null,
      client_secret = null,
      tenant_id     = null
  })
}
