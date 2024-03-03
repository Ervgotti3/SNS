resource "aws_sns_topic" "autoscaling_notifications" {
  name = "autoscaling-notifications"
  //kms_master_key_id = aws_kms_key.sns_key.arn
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "ervinjkershaw@gmail.com"
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email_2" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "jade.awakenmillennial@gmail.com"
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email_3" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "Sherwin.thomas1@gmail.com"
}

resource "aws_sns_topic_subscription" "autoscaling_notifications_email_4" {
  topic_arn = aws_sns_topic.autoscaling_notifications.arn
  protocol  = "email"
  endpoint  = "theowaf@gmail.com"
}

resource "aws_autoscaling_notification" "autoscaling_notifications" {
  group_names = [
    aws_autoscaling_group.tfgapp1_asg.name
  ]
   notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION" 
  ]
  topic_arn =  aws_sns_topic.autoscaling_notifications.arn
}