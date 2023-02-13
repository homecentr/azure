variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "environment_name" { type = string }
variable "display_name_environment_suffix" { type = string }

variable "aad_credentials" {
  type      = string
  sensitive = true
  default   = null
}

variable "proxmox_redirect_urls" { type = list(string) }
variable "argocd_redirect_urls" { type = list(string) }
variable "pomerium_redirect_urls" { type = list(string) }

variable "cloudflare_zone_id" {
  type      = string
  sensitive = true
}

locals {
  aad_credentials = var.aad_credentials != null ? (
    jsondecode(var.aad_credentials)
    ) : ({ # Locally az login should be used
      client_id     = null,
      client_secret = null,
      tenant_id     = null
  })
}
