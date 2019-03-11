/*
 * ec2 launch test
 */
 #ami-936d9d9 is public AMI



data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/ebs/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["paravirtual"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ##ami = "${data.aws_ami.ubuntu.id}"
  ami = "ami-d8d178b9"
  instance_type = "t1.micro"
  key_name = "${aws_key_pair.sonic883b.key_name}"
  subnet_id = "${aws_subnet.primary_01.id}"
  vpc_security_group_ids = [
    "${aws_default_security_group.all_access_from_office.id}"
  ]
  source_dest_check = false
  tags {
    Name = "ubuntu"
  }
}
/*
//EIP
resource "aws_eip" "ubuntu" {
  instance = "${aws_instance.ubuntu.id}"
  vpc = true
}

output "ec2_ubuntu" {

  value = <<EC2_UBNTU

  ami:
  ${data.aws_ami.ubuntu.id}
    ${data.aws_ami.ubuntu.image_id}

  ec2:
  name:${aws_instance.ubuntu.tags.Name}
    id:${aws_instance.ubuntu.id}
    pub_ip:${aws_instance.ubuntu.public_ip}
  eip:
   id: ${aws_eip.ubuntu.id}
   public_ip: ${aws_eip.ubuntu.public_ip}
   private_ip: ${aws_eip.ubuntu.private_ip}

EC2_UBNTU
}
*/
