resource "aws_route53_record" "test-dns-com-A" {
  zone_id = "${data.terraform_remote_state.domain_test_com.zone_id}"
  name    = "test.dns.com"
  type    = "A"
  ttl     = "300"
  records = ["192.168.0.10"]
}


data "terraform_remote_state" "domain_test_com" {
  backend = "s3"

  config {
    bucket  = "sonic883b-terraform"
    key    = "resources/domain/test_com_terraform.tfstate"
    region  = "ap-northeast-1"
  }
}