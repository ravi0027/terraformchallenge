
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.rg_region

}

data "azurerm_client_config" "current" {}

resource "azurerm_lb" "lb" {
  count               = var.ispublic ? 1 : 1
  name                = var.lb_name
  location            = var.lb_location
  resource_group_name = azurerm_resource_group.rg_name.name

  frontend_ip_configuration {

    name                 = var.front_ipname
    public_ip_address_id = var.ispublic == true ? azurerm_public_ip.pip[count.index].id : null
    subnet_id            = var.ispublic == true ? null : data.azurerm_subnet.subnet_id.id
  }


}

resource "azurerm_public_ip" "pip" {
  count               = var.ispublic == true ? 1 : 0
  name                = var.pip_name
  location            = var.lb_location
  resource_group_name = azurerm_resource_group.rg_name.name
  allocation_method   = var.allocation_method
  availability_zone   = var.availability_zones
}


data "azurerm_subnet" "subnet_id" {
  name                 = var.subnet_id
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnetgrp_name
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb[0].id
  name            = var.backend_pool_name
}
resource "azurerm_management_lock" "rglock" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.rg_name.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}