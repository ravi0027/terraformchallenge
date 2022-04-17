

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_management_lock" "azurelock" {
  name       = "azurerm_management_lock"
  scope      = azurerm_resource_group.main.id
  lock_level = "ReadOnly"
}

resource "azurerm_redis_cache" "az_redis_cache" {
  name                          = var.name
  location                      = azurerm_resource_group.main.location
  resource_group_name           = azurerm_resource_group.main.name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  public_network_access_enabled = var.public_network_access_enabled
}
