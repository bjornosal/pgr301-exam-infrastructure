resource "statuscake_test" "stage" {
  website_name  = "exam-stage-ping"
  website_url   = "${heroku_app.staging.web_url}ping"
  test_type     = "HTTP"
  contact_group = ["Examinators", "Examee"]

}

resource "statuscake_test" "prod" {
  website_name  = "exam-prod-ping"
  website_url   = "${heroku_app.production.web_url}ping"
  test_type     = "HTTP"
  contact_group = ["Examinators", "Examee"]

}
