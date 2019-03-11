/**
 * Route53
 */

/*
resource "aws_route53_zone" "main" {
  name = "sonic883b.me"
}

resource "aws_route53_zone" "dev" {
  name = "dev.sonic883b.me"

  tags {
    Environmnet = "dev"
  }
}
*/
/*
resource "aws_route53_zone_association" "primary" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  vpc_id = "${aws_vpc.primary.id}"
}

resource "aws_route53_zone_association" "secondary" {
  zone_id = "${aws_route53_zone.dev.zone_id}"
  vpc_id = "${aws_vpc.secondary.id}"
}

*/

/**
 * The only outputs of this tf
 */

/*
output "aws_rout53" {
  value = <<R53_CONFIGURATION





R53_CONFIGURATION
}
*/
