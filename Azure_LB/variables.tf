variable "rg_name" {
  description = "The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
  type        = string
  default     = "my_rg"
}

variable "rg_region" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "eastus"
}

variable "lb_name" {
  type    = string
  default = "bootlabs_lb"
}

variable "lb_location" {
  type    = string
  default = "eastus"
}

variable "ispublic" {
  type    = bool
  default = true
}

variable "front_ipname" {
  type    = string
  default = "bootlabs_frontip"
}

variable "pip_name" {
  type    = string
  default = "bootlabs_pip"
}

variable "allocation_method" {
  type    = string
  default = "Static"
}

variable "availability_zones" {
  type    = string
  default = null
}

variable "vnetgrp_name" {
  type    = string
  default = "test"
}

variable "vnet_name" {
  type    = string
  default = "test-vnet"
}

variable "subnet_id" {
  type    = string
  default = "default"
}

variable "backend_pool_name" {
  type    = string
  default = "test_backend_pool"
}