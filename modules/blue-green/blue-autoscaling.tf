resource "aws_launch_configuration" "blue_lc" {
  name          = "blue_lc_${terraform.workspace}"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data = templatefile("${path.module}/init-script.sh", {
    file_content = "blue version 1.0"
  })
  security_groups = ["${aws_security_group.web.id}"]
}

# Define Auto Scaling Group
resource "aws_autoscaling_group" "blue_asg" {
  name     = "blue_asg_${terraform.workspace}"
  max_size = 2
  min_size = 1

  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_lb_target_group.blue.arn]
  force_delete              = true
  vpc_zone_identifier       = var.private_subnet_ids
  launch_configuration      = aws_launch_configuration.blue_lc.name
  tag {
    key                 = "Name"
    value               = "blue"
    propagate_at_launch = true
  }
}