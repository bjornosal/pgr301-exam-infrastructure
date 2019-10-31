provider "opsgenie" {
  version = "0.2.3"
  api_url = "api.eu.opsgenie.com"
}

#Users
resource "opsgenie_user" "superuser" {
  username  = "super@some.domain.com"
  full_name = "Super Usersson"
  role      = "Owner"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "user1" {
  username  = "user1@some.domain.com"
  full_name = "User1 Usersson"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user" "user2" {
  username  = "user2@some.domain.com"
  full_name = "User2 Usersson"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}
#End users

#User contact
resource "opsgenie_user_contact" "user1_sms" {
  username = "${opsgenie_user.user1.username}"
  to       = "47-91761030"
  method   = "sms"
}

resource "opsgenie_user_contact" "user1_email" {
  username = "${opsgenie_user.user1.username}"
  to       = "bjorn.olav.salvesen@gmail.com"
  method   = "email"
}

resource "opsgenie_user_contact" "user1_voice" {
  username = "${opsgenie_user.user1.username}"
  to       = "47-91761030"
  method   = "voice"
}

resource "opsgenie_user_contact" "user2_email" {
  username = "${opsgenie_user.user2.username}"
  to       = "user2@second.work.email.com"
  method   = "email"
}

resource "opsgenie_user_contact" "user2_voice" {
  username = "${opsgenie_user.user2.username}"
  to       = "47-99999999"
  method   = "voice"
}

resource "opsgenie_user_contact" "user2_sms" {
  username = "${opsgenie_user.user2.username}"
  to       = "47-99999999"
  method   = "sms"
}

#End user contact

# Teams
resource "opsgenie_team" "tier_one" {
  name        = "Tier 1"
  description = "This team deals with the basic shit"

  member {
    id   = "${opsgenie_user.user1.id}"
    role = "user"
  }
  member {
    id   = "${opsgenie_user.user2.id}"
    role = "user"
  }
}

resource "opsgenie_team" "supermen" {
  name        = "Superadmins"
  description = "This team fixes all the things that has Tier 1 can't handle"

  member {
    id   = "${opsgenie_user.superuser.id}"
    role = "admin"
  }
}
# End teams

#Schedule
resource "opsgenie_schedule" "tier_one_schedule" {
  name          = "tier1-schedule"
  description   = "Schedule for the Tier 1 team"
  timezone      = "Europe/Oslo"
  owner_team_id = "${opsgenie_team.tier_one.id}"
}

resource "opsgenie_schedule_rotation" "tier_1_rotation" {
  schedule_id = "${opsgenie_schedule.tier_one_schedule.id}"
  name        = "tier1-schedule-rotation"
  start_date  = "2019-11-05T00:00:00Z"
  end_date    = "2019-12-04T08:00:00Z"
  type        = "daily"
  length      = 8

  participant {
    type = "team"
    id   = "${opsgenie_team.tier_one.id}"
  }

  time_restriction {
    type = "time-of-day"

    restriction {
      start_hour = 0
      start_min  = 0
      end_hour   = 8
      end_min    = 0
    }
  }
}
