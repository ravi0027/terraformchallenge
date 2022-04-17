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
variable "dns_prefix" {
  description = "The name of the Redis instance."
  type        = string
}
variable "aks_sku_tier" {
  description = "aks sku tier. Possible values are Free ou Paid"
  type        = string
  default     = "Free"
}
variable "private_dns_zone_id" {
  type        = string
  default     = null
  description = "Either the ID of Private DNS Zone which should be delegated to this Cluster"
}
variable "private_dns_zone_type" {
  type        = string
  description = "Id of the private DNS Zone when <private_dns_zone_type> is custom"
}

variable "private_cluster_enabled" {
  description = "Configure AKS as a Private Cluster"
  type        = bool
}
variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to allow for incoming traffic to the server nodes."
  type        = list(string)
}
variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Kubernetes Cluster."
  type        = bool
  default     = true
}
variable "default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
}
variable "default_node_pool_count" {
  description = "Name of the default node pool"
  type        = number
}
variable "default_node_pool_vm_size" {
  description = "Name of the default node pool"
  type        = string
}
variable "node_pool1_count" {
  description = "Name of the node pool1"
  type        = number
}
variable "node_pool1_vm_size" {
  description = "Name of the node pool1"
  type        = string
}
variable "node_pool2_count" {
  description = "Name of the node pool2"
  type        = number
}
variable "node_pool2_vm_size" {
  description = "Name of the  node pool2"
  type        = string
}