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

variable "azurerm_key_vault_name" {
  type    = string
  default = "bootlabssecret"
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

variable "key_permissions" {
  type = list(string)
  default = [
    "create",
    "get",
  ]
}

variable "secret_permissions" {
  type = list(string)
  default = [
    "set",
    "get",
    "delete",
    "purge",
    "recover"
  ]
}

variable "secret_name" {
  type    = string
  default = "mysecret"
}

variable "secret_value" {
  type      = string
  sensitive = true
  default   = "notasecret"
}