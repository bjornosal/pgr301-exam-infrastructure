terraform {
  backend "s3" {
    bucket = "pgr301bucket"
    key    = "examinator/terraform.tfstate"
    region = "eu-north-1"
  }
}