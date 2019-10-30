resource "statuscake_test" "stage-http" {
  website_name  = "exam-stage-ping"
  website_url   = "${heroku_app.staging.web_url}ping"
  test_type     = "HTTP"
  contact_group = ["Tier 1"]
}
resource "statuscake_test" "stage-ping" {
  website_name  = "exam-stage-ping"
  website_url   = "${heroku_app.staging.web_url}/devices"
  test_type     = "PING"
  contact_group = ["Tier 1"]
}

resource "statuscake_test" "prod-http" {
  website_name  = "exam-prod-ping"
  website_url   = "${heroku_app.production.web_url}ping"
  test_type     = "HTTP"
  contact_group = ["Tier 1"]
}

resource "statuscake_test" "prod-ping" {
  website_name  = "exam-prod-ping"
  website_url   = "${heroku_app.production.web_url}ping"
  test_type     = "PING"
  contact_group = ["Tier 1"]
}
