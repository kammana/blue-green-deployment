resource "aws_lb_target_group" "green" {
  name     = "green-tg-${terraform.workspace}"
  port     = var.blue_health["target_port"]
  protocol = var.blue_health["target_protocol"]
  vpc_id   = var.vpc_id

  health_check {
    port     = var.green_health["port"]
    protocol = var.green_health["protocol"]
    timeout  = var.green_health["timeout"]
    interval = var.green_health["interval"]
    path     = var.green_health["path"]
  }
}