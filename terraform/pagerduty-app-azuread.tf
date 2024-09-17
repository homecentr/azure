resource "pagerduty_service" "azuread" {
  name                    = "Azure AD"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = pagerduty_escalation_policy.default.id
  alert_creation          = "create_alerts_and_incidents"
}


resource "pagerduty_service_integration" "azuread_azureautomation" {
  name              = "Gatus"
  type              = "events_api_v2_inbound_integration"

  service = pagerduty_service.cloudflare.id
}
