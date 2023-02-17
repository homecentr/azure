variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_apps" {
  type = list(object({
    subdomain        = string
    display_name     = string
    allow_non_admins = bool
  }))

  default = [
    {
      subdomain        = "homepage"
      display_name     = "Homepage"
      allow_non_admins = true
    }
  ]
}

variable "cloudflare_ssh_hosts" {
  type = list(object({
    hostname = string
  }))
}

variable "cloudflare_apps_subdomain_suffix" { type = string }
variable "cloudflare_apps_root_domain" { type = string }

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

locals {
  aad_credentials = var.aad_credentials != null ? (
    jsondecode(var.aad_credentials)
    ) : ({ # Locally az login should be used
      client_id     = null,
      client_secret = null,
      tenant_id     = null
  })
}
