resource "pagerduty_service" "pbs" {
  name                    = "Proxmox Backup Server"
  auto_resolve_timeout    = 7 * 24 * 60 * 60
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.default.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service_integration" "pbs" {
  name              = "PBS E-mail Alerts"
  type              = "generic_email_inbound_integration"
  integration_email = "proxmox-backup-server-email@${sensitive(data.sops_file.secrets.data["pagerduty_email_domain"])}"

  service = pagerduty_service.pbs.id
}

resource "pagerduty_service_integration" "pbs_gatus" {
  name              = "Gatus"
  type              = "events_api_v2_inbound_integration"

  service = pagerduty_service.pbs.id
}
