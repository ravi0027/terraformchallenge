resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "az_aks" {
  name                            = var.name
  location                        = var.resource_group_name
  resource_group_name             = var.resource_group_location
  dns_prefix                      = var.dns_prefix
  sku_tier                        = var.aks_sku_tier
  public_network_access_enabled   = var.public_network_access_enabled
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  private_cluster_enabled         = var.private_cluster_enabled
  private_dns_zone_id             = var.private_cluster_enabled == "Custom" ? var.private_dns_zone_id : var.private_dns_zone_type

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.default_node_pool_count
    vm_size    = var.default_node_pool_vm_size
  }

}

resource "node_pool1" "example1" {
  name                  = "primary"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.az_aks.id
  vm_size               = var.node_pool1_vm_size
  node_count            = var.node_pool1_count
}

resource "node_pool2" "example2" {
  name                  = "secondary"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.az_aks.id
  vm_size               = var.node_pool1_vm_size
  node_count            = var.node_pool1_count
  priority              = "Spot"

}
