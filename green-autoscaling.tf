resource "aws_launch_configuration" "green_lc" {
  name          = "green-lc"
  image_id      = local.ubuntu_ami
  instance_type = "t2.micro"
  user_data = templatefile("./init-script.sh", {
    file_content = "green version 1.0"
  })
  security_groups = ["${aws_security_group.web.id}"]
}

# Define Auto Scaling Group
resource "aws_autoscaling_group" "green_asg" {
  name     = "green_asg"
  max_size = 2
  min_size = 1

  health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns         = [aws_lb_target_group.green.arn]
  force_delete              = true
  vpc_zone_identifier       = [local.public_a_subnet_id, local.public_b_subnet_id]
  launch_configuration      = aws_launch_configuration.green_lc.name
  tag {
    key                 = "Name"
    value               = "green"
    propagate_at_launch = true
  }
}