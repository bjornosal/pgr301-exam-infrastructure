terraform {
  backend "s3" {
    bucket = "pgr301bucket"
    key    = "salbjo/terraform.tfstate"
    region = "eu-north-1"
  }
}