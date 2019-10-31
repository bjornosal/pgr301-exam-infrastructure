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

