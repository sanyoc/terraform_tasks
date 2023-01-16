resource "aws_lb_target_group" "alb_tg" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.task_vpc.id
  health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2
  }
  tags = var.task_tags
}

resource "aws_lb_target_group_attachment" "attach_instances" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  count            = var.ec2_count
  target_id        = aws_instance.instance[count.index].id
  port             = 80
}

resource "aws_lb_listener" "listeners" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb" "alb" {
  name               = "task-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_vpc_sg.id]
  subnets            = local.ec2_subnet_list
  tags               = var.task_tags
}