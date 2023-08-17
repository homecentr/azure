resource "pagerduty_escalation_policy" "default" {
  name        = "Default"
  description = "Default escalation policy for all services"

  teams = [
    pagerduty_team.default.id
  ]

  rule {
    escalation_delay_in_minutes = 3

    target {
      type = "user_reference"
      id   = data.pagerduty_user.me.id
    }
  }
}
