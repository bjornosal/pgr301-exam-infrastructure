terraform {
  backend "s3" {
    bucket = "pgr301bucket"
    key    = "${bucket_name}/terraform.tfstate"
    region = "eu-north-1"
  }
}