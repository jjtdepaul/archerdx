terraform {
  backend "s3" {
    bucket = "for-tf-state-files"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}