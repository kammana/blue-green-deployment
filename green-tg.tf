resource "aws_lb_target_group" "green" {
  name     = "green-tg-green-lb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}