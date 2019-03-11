/*
 * Module of IAM Role
 */

variable "name" {
  description = "The role's name"
}
variable "path" {
  description = "Path in which to create the policy"

  default = "/"
}
# NOTE: This variable is only used for grants permissions means Effect "Allow",
#       If U want to Effect "Deny", please use iam custom policies (variable: policy_arns)
variable "assume_role_policy_services" {
  description = "The policy document grants entity of Principal > Service"

  type = "list"
  default = ["ec2.amazonaws.com"]
}
variable "policy_arns" {
  description = "The list of policy arns"

  type = "list"
  # This module require declared cause IAM user attached policies more than one
  #default = []
}


resource "aws_iam_role" "role" {
  name = "${var.name}"
  path = "${var.path}"
  assume_role_policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ${jsonencode(var.assume_role_policy_services)}
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOT
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name}"
  path = "${var.path}"
  roles = ["${aws_iam_role.role.name}"]

  depends_on = ["aws_iam_role.role"]
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  count = "${length(var.policy_arns)}"

  role = "${aws_iam_role.role.name}"
  policy_arn = "${element(var.policy_arns, count.index)}"

  depends_on = ["aws_iam_role.role"]
}


output "role_name"              { value = "${aws_iam_role.role.name}" }
output "role_unique_id"         { value = "${aws_iam_role.role.unique_id}" }
output "role_arn"               { value = "${aws_iam_role.role.arn}" }

output "instance_profile_name"  { value = "${aws_iam_instance_profile.instance_profile.name}" }
output "instance_profile_id"    { value = "${aws_iam_instance_profile.instance_profile.id}" }
output "instance_profile_arn"   { value = "${aws_iam_instance_profile.instance_profile.arn}" }
