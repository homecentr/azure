resource "pagerduty_service" "traefik_backup" {
  name                    = "Traefik (Backup)"
  auto_resolve_timeout    = 7 * 24 * 60 * 60
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.default.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service_integration" "traefik_backup_acme" {
  name              = "ACME"
  type              = "generic_email_inbound_integration"
  integration_email = "traefik-backup-acme@${sensitive(data.sops_file.secrets.data["pagerduty_email_domain"])}"

  service = pagerduty_service.traefik_backup.id
}

resource "pagerduty_service_integration" "traefik_backup_gatus" {
  name = "Gatus"
  type = "events_api_v2_inbound_integration"

  service = pagerduty_service.traefik_backup.id
}
