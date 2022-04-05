resource "aws_lb_target_group" "blue" {
  name     = "blue-tg-blue-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
    path     = "/"
  }
}