provider "aws" {
  profile = "sonic883b"
  region  = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "sonic883b-terraform"
    key    = "resources/domain/test02_com_terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "sonic883b"
  }
}
