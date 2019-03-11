resource "aws_route53_zone" "test-dns-com" {
  name = "test.dns.com"
}




output "zone_id" {
    value = "${aws_route53_zone.test-dns-com.zone_id}"
} 