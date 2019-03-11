provider "aws" {
  profile = "sonic883b"
  region  = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "sonic883b-terraform"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "sonic883b"
  }
}


resource "aws_key_pair" "sonic883b" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}


