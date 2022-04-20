variable "resource_group_name" {
  type        = string
  description = "resource_group_name"
}

variable "resource_group_location" {
  type        = string
  description = "resource_group_location"
}

variable "name" {
  type        = string
  description = "container registry name"
}

variable "sku" {
  type        = string
  description = "sku name of container registry this can be like, Basic, Standard, Premium"
}