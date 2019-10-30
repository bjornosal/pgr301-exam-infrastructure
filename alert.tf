provider "opsgenie" {
  version = "0.2.3"
  api_url = "api.eu.opsgenie.com"
}

resource "opsgenie_user" "user1" {
  username  = "user1@some.domain.com"
  full_name = "User1 Usersson"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}

resource "opsgenie_user_contact" "sms" {
  username = "${opsgenie_user.user1.username}"
  to      = "004791761030"
  method  = "sms"
}

resource "opsgenie_user_contact" "email" {
  username = "${opsgenie_user.user1.username}"
  to      = "bjorn.olav.salvesen@gmail.com"
  method  = "email"
}

resource "opsgenie_user_contact" "voice" {
  username = "${opsgenie_user.user1.username}"
  to      = "004791761030"
  method  = "voice"
}
