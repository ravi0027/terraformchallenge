variable "rg_name" {
  description = "The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
  type        = string
  default     = "test"
}

variable "rg_region" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "westus"
}

variable "vnet_name" {
  type        = string
  description = "Vnet name."
  default     = "test-vnet"
}

variable "address_prefixes" {
  default = ["10.0.2.0/24"]
  type    = list(string)
}

variable "subnet_name" {
  type    = string
  default = "test_subnet"
}

variable "private_dns_zone_name" {
  type    = string
  default = "bootlabs.tech.com"
}

variable "mysqlflex_servername" {
  type        = string
  description = "Name of the flexible server."
  default     = "bootlabs-mysqlflex-server"
}

variable "retention_days" {
  type    = number
  default = 7
}

variable "admin_name" {
  type        = string
  description = "MySQL Flexible server admin name."
  default     = "mysqlflex_server_admin"
}

variable "admin_pwd" {
  type        = string
  sensitive   = true
  description = "MySQL flex server pwd."
  default     = "Qwerty@123"
}

variable "sku_name" {
  default = "GP_Standard_D2ds_v4"
  type    = string
}

