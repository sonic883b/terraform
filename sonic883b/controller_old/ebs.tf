/*
 * ebs volumes
 */

/*
resource "aws_ebs_volume" "jenkins_persistent" {
  availability_zone = "${aws_subnet.primary_01.availability_zone}"
  size = 5
  type = "gp2"

  tags{
    Name = "jenkins:persistent"
  }
}

output "jenkins" {
  value = <<JENKINS_CONFIGURATION

  jenkins:
    ebs:
      "${aws_ebs_volume.jenkins_persistent.tags.Name}": ${aws_ebs_volume.jenkins_persistent.id}

JENKINS_CONFIGURATION
}
 */
