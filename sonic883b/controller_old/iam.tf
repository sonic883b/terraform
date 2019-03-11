/*
 * IAM
 */

## IAM role
/*
resource "aws_iam_role" "lambda_notify_to_slack" {
  name = "lambda_notify_to_slack"
  assume_role_policy = "${file("./iam/lambda_role_policy.json")}"
}
*/


variable "_iam_namespace" {
  default = "arn:aws:iam::695149855287"
}
## Policies
/*
module "iam_policy_lambda_notify_to_slack" {
  source = "./tf_modules/iam/policy"
  name = "lambda_notify_to_slack"
  description = "use lambda function for cloudwatch to slack notify"
}
*/

## Policies

resource "aws_iam_policy" "lambda_notify_to_slack" {
  name        = "lambda-notify-to-slack"
  path        = "/"
  description = ""
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "LambdaNotifyToSlacktest",
      "Effect": "Allow",
      "Action": "kms:Decrypt",
      "Resource": "${aws_kms_key.notify_to_slack.arn}"
    }
  ]
}
EOF

  depends_on = ["aws_kms_alias.notify_to_slack"]

}

## Roles


## Roles
module "iam_role_lambda_notify_to_slack" {
  source = "./tf_modules/iam/role"
  name = "lambda_notify_to_slack"
  policy_arns = [
    "${var._iam_namespace}:policy/lambda-notify-to-slack"
  ]
  assume_role_policy_services = [
    "lambda.amazonaws.com",
  ]
}

### KMS

resource "aws_kms_key" "notify_to_slack"{
}

resource "aws_kms_alias" "notify_to_slack" {
  name = "alias/notify_to_slack01"
  target_key_id = "${aws_kms_key.notify_to_slack.id}"
}

### output

output "aws_kms_key_notify_to_slack_arn" {
  value = "${aws_kms_key.notify_to_slack.arn}"
}

output "aws_kms_alias_notify_to_slack_alias" {
  value = "${aws_kms_alias.notify_to_slack.name}"
}

