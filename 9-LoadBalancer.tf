resource "aws_lb" "tfgapp1_alb" {
  name               = "tfgapp1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tfgapp1-sg02-LB01.id]
  subnets            = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
    aws_subnet.public-us-east-1c.id,
    
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "tfgapp1LoadBalancer"
    Service = "tfgapp1"
    Owner   = "Megatron"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.tfgapp1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tfgapp1_tg.arn
  }
}

data "aws_acm_certificate" "cert" {
  domain   = "technology4gold.com"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.tfgapp1_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tfgapp1_tg.arn
  }
}

output "lb_dns_name" {
  value       = aws_lb.tfgapp1_alb.dns_name
  description = "The DNS name of the tfgapp1 Load Balancer."
}
