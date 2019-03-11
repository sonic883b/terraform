/*
 * AWS lambda
 */

# for use IAM role
/*
resource "aws_iam_role" "lambda" {
  name = "lambda"
  assume_role_policy = "${file("./iam/lambda_role_policy.json")}"
}
*/

/*
# lambda
resource "aws_lambda_function" "notify_to_slack" {
  filename = "lambda/dev-notify_to_slack.zip"
  function_name = "notify-to-slack"
  role = "${aws_iam_role.lambda.arn}"
  handler = "index.handler"
}
*/