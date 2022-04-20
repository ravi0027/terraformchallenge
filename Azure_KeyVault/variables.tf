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

variable "key_vault_name" {
  type = string
  default= "bootlabskeyvault"
}

variable "disk_encryption" {
  type = bool
  default = true
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
}

variable "purge_protection_enabled" {
  type = bool
  default = false
}
