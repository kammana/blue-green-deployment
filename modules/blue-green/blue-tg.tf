resource "aws_lb_target_group" "blue" {
  name     = "blue-tg-${terraform.workspace}"
  port     = var.blue_health["target_port"]
  protocol = var.blue_health["target_protocol"]
  vpc_id   = var.vpc_id

  health_check {
    port     = var.blue_health["port"]
    protocol = var.blue_health["protocol"]
    timeout  = var.blue_health["timeout"]
    interval = var.blue_health["interval"]
    path     = var.blue_health["path"]
  }
}