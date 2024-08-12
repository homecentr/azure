resource "pagerduty_service" "docs" {
  name                    = "Docs"
  auto_resolve_timeout    = 7 * 24 * 60 * 60
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.default.id
  alert_creation          = "create_alerts_and_incidents"
}

resource "pagerduty_service_integration" "docs_gatus" {
  name              = "Gatus"
  type              = "events_api_v2_inbound_integration"

  service = pagerduty_service.docs.id
}
