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

variable "mysql_server_name" {
  description = "The name of the database."
  type        = string
  default     = "bootlabsmysql"
}

variable "mysql_server_region" {
  description = "MYSQL server region.Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "westus"
}

variable "mysql_version" {
  description = "version of MYSQL."
  default     = "5.7"
}

variable "mysql_server_admin_name" {
  description = "SQL server admin name."
  type        = string
  default     = "mysqlserveradmin"
}

variable "mysql_server_pwd" {
  description = "SQL server password."
  sensitive   = true
  type        = string
  default     = "Qwerty@123"
}

variable "sku_name" {
  type    = string
  default = "B_Gen5_2"
}

variable "storage_mb" {
  type    = number
  default = 5120
}

variable "mysql_dbname" {
  type        = string
  description = "MySQL database name"
  default     = "bootlabs_db"
}

variable "auto_grow_enable" {
  type    = bool
  default = true
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup_enable" {
  type    = bool
  default = false
}

variable "infrastructure_encryption_enable" {
  type    = bool
  default = false
}

variable "public_network_access_enable" {
  type    = bool
  default = true
}
variable "ssl_enforcement_enable" {
  type    = bool
  default = true
}