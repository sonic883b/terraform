provider "aws" {
  profile = "sonic883b"
  region  = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "sonic883b-terraform"
    key    = "resources/domain/test_com_terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "sonic883b"
  }
}


data "terraform_remote_state" "domain_test_com" {
  backend = "s3"

  config {
    bucket  = "sonic883b-terraform"
    key    = "resources/domain/test_com_terraform.tfstate"
    region  = "ap-northeast-1"
  }
}