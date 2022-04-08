variable "rg_name" {
  description = "The name of the resource group in which to create the database. This must be the same as Database Server resource group currently."
  type        = string
  default     = "my_rg"
}

variable "rg_region" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "westus"
}

variable "storageaccname" {
  default = "bootlabsstorageacc"
  type    = string

}

variable "mssql_server_name" {
  type    = string
  default = "bootlabs-mssqlserver-name"
}

variable "db_version" {
  type    = string
  default = "12.0"
}

variable "ms_admin" {
  type    = string
  default = "bootlabs-admin"
}

variable "ms_pwd" {
  type    = string
  default = "!@#QWErty@321"
}

variable "retention_days" {
  type    = number
  default = 7
}

variable "db_name" {
  type    = string
  default = "mssql_db"
}

variable "read_scale" {
  type    = bool
  default = true
}

variable "zone_redundant" {
  type    = bool
  default = true
}

variable "sku_name" {
  type    = string
  default = "BC_Gen5_2"
}

variable "max_size_gb" {
  type    = number
  default = 4
}