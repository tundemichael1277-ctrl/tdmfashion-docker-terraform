
# =====================================
# APPLICATION LOAD BALANCER
# =====================================

resource "aws_lb" "httpd" {
  name               = "httpd"
  load_balancer_type = "application"

  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  security_groups = [aws_security_group.alb.id]

  tags = {
    Name = "httpd-alb"
  }
}

# =====================================
# TARGET GROUP
# =====================================

resource "aws_lb_target_group" "httpd" {
  name        = "httpd"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.main.id

  health_check {
    path = "/"
  }

  tags = {
    Name = "httpd-target-group"
  }
}

# =====================================
# HTTP LISTENER
# =====================================

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.httpd.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.httpd.arn
  }
}
