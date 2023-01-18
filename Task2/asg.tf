resource "aws_autoscaling_group" "asg" {
  name                      = "asg"
  vpc_zone_identifier       = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 120
  target_group_arns         = [aws_lb_target_group.tasktg.arn]
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Web"
    propagate_at_launch = true
  }
}