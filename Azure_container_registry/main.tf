module "azurerm_container_registry" {
  source                  = "./acr"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  name                    = var.name
  sku                     = var.sku
}