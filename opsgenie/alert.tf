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

