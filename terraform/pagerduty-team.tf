resource "pagerduty_team" "default" {
  name        = "Homecentr Support"
  description = "Homecentr Support"
}

resource "pagerduty_team_membership" "me" {
  user_id = data.pagerduty_user.me.id
  team_id = pagerduty_team.default.id

  role = "manager"
}
