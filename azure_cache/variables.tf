variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "resource_group_location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}
variable "name" {
  description = "The name of the Redis instance."
  type        = string
}
variable "capacity" {
  description = "The size of the Redis cache to deploy. "
  type        = number
}
variable "family" {
  description = "The SKU family/pricing group to use. "
  type        = string
}
variable "sku_name" {
  description = "The SKU of Redis to use."
  type        = string
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this Redis Cache."
  type        = bool
}
