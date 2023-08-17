resource "pagerduty_service" "idrac" {
  name                    = "Dell iDRAC${var.display_name_environment_suffix}"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.default.id
  alert_creation          = "create_alerts_and_incidents"

  alert_grouping_parameters {
    type = "intelligent"
  }
}

resource "pagerduty_service_integration" "idrac_pve1" {
  name              = "iDRAC PVE1 E-mail Alerts"
  type              = "generic_email_inbound_integration"
  integration_email = "idrac-pve1@${sensitive(data.sops_file.secrets.data["pagerduty_email_domain"])}"

  service = pagerduty_service.idrac.id
}

resource "pagerduty_service_integration" "idrac_pve2" {
  name              = "iDRAC PVE2 E-mail Alerts"
  type              = "generic_email_inbound_integration"
  integration_email = "idrac-pve2@${sensitive(data.sops_file.secrets.data["pagerduty_email_domain"])}"

  service = pagerduty_service.idrac.id
}
