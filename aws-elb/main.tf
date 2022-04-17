resource "aws_elb" "awselb" {

  name    = var.name
  subnets = var.subnets

  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }

  instances                 = var.instances
  cross_zone_load_balancing = var.cross_zone_load_balancing
  idle_timeout              = var.idle_timeout
}