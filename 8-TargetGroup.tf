resource "aws_lb_target_group" "tfgapp1_tg" {
  name     = "tfgapp1-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tfgapp1.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "tfgapp1-TargetGroup"
    Service = "GetMoneyApp1"
    Owner   = "User"
    Project = "Web Service"
  }
}
