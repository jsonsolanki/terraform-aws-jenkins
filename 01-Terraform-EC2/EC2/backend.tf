terraform {
  backend "s3" {
  bucket = "bits-log-observ"
  region = "us-west-1"
  key = "test/terraform.tfstate"
  }
}
