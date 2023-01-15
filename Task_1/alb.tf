resource "aws_lb_target_group" "alb-tg" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.task-vpc.id
  health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2
  }
  tags = var.task-tags
}

resource "aws_lb_target_group_attachment" "attach-instance1" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-instance2" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.instance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-instance3" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.instance3.id
  port             = 80
}

resource "aws_lb_listener" "listeners" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}

resource "aws_lb" "alb" {
  name               = "task-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.myVPC-sg.id]
  subnets            = [aws_subnet.public-1a.id, aws_subnet.public-1b.id, aws_subnet.public-1c.id]
  tags               = var.task-tags
}