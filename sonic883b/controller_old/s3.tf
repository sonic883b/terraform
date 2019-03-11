resource "aws_s3_bucket" "terraform_state" {
  bucket = "myinfra-terraform-state"
  acl = "private"

  tags {
    Name = "Terraform Remote Config"
    Desc = "For commands of terraform remote"
  }
}

resource "aws_s3_bucket" "lambda_function" {
  bucket = "myinfra-lambda-function"
  acl = "private"

  tags {
    Name = "Lambda Function"
    Dsec = "Strage of lambda function code"
  }
}


terraform {
  backend "s3" {
  }
}

output "s3" {
  value = <<S3_CONFIGURATION

  - ${aws_s3_bucket.terraform_state.bucket} #=> ${aws_s3_bucket.terraform_state.tags.Desc}
  - ${aws_s3_bucket.lambda_function.bucket} #=> ${aws_s3_bucket.lambda_function.tags.Dsec}

S3_CONFIGURATION
}
