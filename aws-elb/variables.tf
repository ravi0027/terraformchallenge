variable "name" {
  type        = string
  description = "The name of the ELB."
}

variable "subnets" {
  type        = list(string)
  description = "A list of subnet IDs to attach to the ELB."
}

variable "instance_port" {
  description = " The port on the instance to route to."
  type        = number
}

variable "instance_protocol" {
  description = "The protocol to use to the instance. Valid values are HTTP, HTTPS, TCP, or SSL."
  type        = string

}
variable "lb_port" {
  description = "The port to listen on for the load balancer."
  type        = number
}
variable "lb_protocol" {
  description = "The protocol to listen on. Valid values are HTTP, HTTPS, TCP, or SSL."
  type        = string

}

variable "instances" {
  type        = list(string)
  description = "The list of instances in the ELB"
}
variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing."
  type        = bool
  default     = true
}
variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}