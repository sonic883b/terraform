/*
 * cloudwatch and SNS
 */





### cloudwatch_alarm

resource "aws_cloudwatch_metric_alarm" "ubuntu_status_terraform" {
  alarm_name = "ubuntu_status_terraform"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "1"
  metric_name = "StatusCheckFailed"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Minimum"
  threshold = "2"
  dimensions {
    InstanceId = "${aws_instance.ubuntu.id}"
  }
  alarm_description = "ubuntu_status"
  ok_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  alarm_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  insufficient_data_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  depends_on = ["aws_sns_topic.notify_to_slack"]
}

resource "aws_cloudwatch_metric_alarm" "ubuntu_cpu_terraform" {
  alarm_name = "ubuntu_cpu_terraform"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "80"
  dimensions {
    InstanceId = "${aws_instance.ubuntu.id}"
  }
  alarm_description = "ubuntu_CPU_Utilization"
  ok_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  alarm_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  insufficient_data_actions = ["${aws_sns_topic.notify_to_slack.arn}"]
  depends_on = ["aws_sns_topic.notify_to_slack"]
}

### SNS
resource "aws_sns_topic" "notify_to_slack" {
  name = "notify_to_slack"
}



output "cloudwatch_alartm" {
  value = "${aws_cloudwatch_metric_alarm.ubuntu_status_terraform.id}"
 # value = "${aws_cloudwatch_metric_alarm.ubuntu_cpu_terraform.id}"

}

output "sns_topic" {
  value = "${aws_sns_topic.notify_to_slack.id}"
 ## value = "${aws_sns_topic.notify_to_slack_terraform.arn}"
}



