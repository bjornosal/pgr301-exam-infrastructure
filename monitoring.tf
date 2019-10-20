resource "statuscake_test" "stage" {
  website_name  = "exam-stage"
  website_url   = "${heroku_app.staging.web_url}"
  test_type     = "HTTP"
  contact_group = ["Examinators", "Examee"]

}

resource "statuscake_test" "prod" {
  website_name  = "app-prod"
  website_url   = "${heroku_app.production.web_url}"
  test_type     = "HTTP"
  contact_group = ["Examinators", "Examee"]

}
