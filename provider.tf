terraform {
  backend "s3" {
    bucket = "pgr301bucket"
    key    = "bjornosal/terraform.tfstate"
    region = "eu-north-1"
  }
}