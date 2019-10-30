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
  user_id = "${opsgenie_user.user1.id}"
  to      = "+4791761030"
  method  = "sms"
}

resource "opsgenie_user_contact" "email" {
  user_id = "${opsgenie_user.user1.id}"
  to      = "bjorn.olav.salvesen@gmail.com"
  method  = "email"
}

resource "opsgenie_user_contact" "voice" {
  user_id = "${opsgenie_user.user1.id}"
  to      = "+4791761030"
  method  = "voice"
}
