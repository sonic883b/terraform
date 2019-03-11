/*
 * Module of IAM Policy
 */

variable "name" {
  description = "The name of policy"
}

variable "path" {
  description = "Path in which to create the policy"
  default = "/"
}

variable "description" {
  description = "Description of the IAM Policy"
}

variable "policy" {

  default = "/"

}
resource "aws_iam_policy" "iam_policy" {
  name = "${var.name}"
  path = "${var.path}"
  description = "${var.description}"
  policy = "${file("${path.root}/modules/iam/policies/${var.name}.json")}"
}

output "id"           { value = "${aws_iam_policy.iam_policy.id}" }
output "arn"          { value = "${aws_iam_policy.iam_policy.arn}" }
output "description"  { value = "${aws_iam_policy.iam_policy.description}" }
output "name"         { value = "${aws_iam_policy.iam_policy.name}" }
output "path"         { value = "${aws_iam_policy.iam_policy.path}" }
output "policy"       { value = "${aws_iam_policy.iam_policy.policy}" }