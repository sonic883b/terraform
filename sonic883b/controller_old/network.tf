/*
 * Networking of controlller VPC:w
 */

### primary

resource "aws_vpc" "primary" {
 cidr_block = "10.0.0.0/16"
 ## instance_tenancy = "default"

 enable_dns_support = true
 enable_dns_hostnames = true
 enable_classiclink = false

 tags {
  Name = "primary"
 }
}

resource "aws_subnet" "primary_01" {
 vpc_id = "${aws_vpc.primary.id}"
 cidr_block = "${var.cidr_blocks["primary_01"]}"

 tags{
  Name = "primary_01"
 }
}

resource "aws_internet_gateway" "public_primary" {
 vpc_id = "${aws_vpc.primary.id}"

 tags {
  Name = "${aws_vpc.primary.tags.Name}"
 }
}

resource "aws_route_table" "primary" {
  vpc_id = "${aws_vpc.primary.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.public_primary.id}"
  }
  tags {
    Name = "primary:route_table"
  }
}

resource "aws_route_table_association" "primary" {
  subnet_id = "${aws_subnet.primary_01.id}"
  route_table_id = "${aws_route_table.primary.id}"
}

resource "aws_default_security_group" "all_access_from_office" {
  vpc_id = "${aws_vpc.primary.id}"

  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    self = true
    cidr_blocks = [
      "${var.vg_office["CIDR_OFFICE_1STPLACE_FAILOVER"]}",
      "${var.vg_office["CIDR_OFFICE_1STPLACE_WIRELESS"]}",
      "${var.vg_office["CIDR_OFFICE_SJDC"]}",
    ]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "AllAccessFromOfficeSecurtyGroup"
  }


}

### secondary
/*
resource "aws_vpc" "secondary" {
 cidr_block = "10.1.0.0/16"
 ## instance_tenancy = "default"

 enable_dns_support = true
 enable_dns_hostnames = true
 enable_classiclink = false

 tags {
  Name = "secondary"
 }
}

resource "aws_subnet" "secondary_01" {
 vpc_id = "${aws_vpc.secondary.id}"
 cidr_block = "${var.cidr_blocks["secondary_01"]}"

 tags {
  Name = "secondary_01"
 }
}
resource "aws_internet_gateway" "public_secondary" {
 vpc_id = "${aws_vpc.secondary.id}"

 tags {
  Name = "${aws_vpc.secondary.tags.Name}"
 }
}

*/

/**
 * The only outputs of this tf
 */

/*
output "network" {
 value = <<NETWORK_CONFIGURATION

 VPC:
  ${aws_vpc.primary.tags.Name}
    id: ${aws_vpc.primary.id}
    cidr_block: ${aws_vpc.primary.cidr_block}

  ${aws_vpc.secondary.tags.Name}
    id: ${aws_vpc.secondary.id}
    cidr_block: ${aws_vpc.secondary.cidr_block}

  Internet Gateway:
    ${aws_internet_gateway.public_primary.tags.Name}
      id: ${aws_internet_gateway.public_primary.id}

    ${aws_internet_gateway.public_secondary.tags.Name}
      id: ${aws_internet_gateway.public_secondary.id}


  Route Tables:
    ${aws_route_table.primary.tags.Name}:
      id: ${aws_route_table.primary.id}

 Subnet:
  ${aws_subnet.primary_01.tags.Name}
     id: ${aws_subnet.primary_01.id}
     cidr_block: ${aws_subnet.primary_01.cidr_block}
     availability_zone: ${aws_subnet.primary_01.availability_zone}

  ${aws_subnet.secondary_01.tags.Name}
     id: ${aws_subnet.secondary_01.id}
     cidr_block: ${aws_subnet.secondary_01.cidr_block}
     availability_zone: ${aws_subnet.secondary_01.availability_zone}

  Route Tables:
    ${aws_route_table.primary.tags.Name}:
      id: ${aws_route_table.primary.id}

 Subnet:
  ${aws_subnet.primary_01.tags.Name}
     id: ${aws_subnet.primary_01.id}
     cidr_block: ${aws_subnet.primary_01.cidr_block}
     availability_zone: ${aws_subnet.primary_01.availability_zone}

  ${aws_subnet.secondary_01.tags.Name}
     id: ${aws_subnet.secondary_01.id}
     cidr_block: ${aws_subnet.secondary_01.cidr_block}
     availability_zone: ${aws_subnet.secondary_01.availability_zone}

  Security Groups:

    ${aws_default_security_group.all_access_from_office.tags.Name}:
      id: ${aws_default_security_group.all_access_from_office.id}
      description: (default) For all protocal accessed from office

NETWORK_CONFIGURATION
}
*/
