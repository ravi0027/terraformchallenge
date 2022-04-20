

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.rg_region
}


resource "azurerm_virtual_network" "vnet_name" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = var.address_prefixes
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_assn" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.rg_name.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "bootlabs.com"
  private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.vnet_name.id
  resource_group_name   = azurerm_resource_group.rg_name.name
}

resource "azurerm_mysql_flexible_server" "mysql_flexserver" {
  name                   = var.mysqlflex_servername
  resource_group_name    = azurerm_resource_group.rg_name.name
  location               = azurerm_resource_group.rg_name.location
  administrator_login    = var.admin_name
  administrator_password = var.admin_pwd
  backup_retention_days  = var.retention_days
  delegated_subnet_id    = azurerm_subnet.subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.private_dns_zone.id
  sku_name               = var.sku_name

  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}

# resource "azurerm_management_lock" "rglock" {
#   name       = "resource-group-level"
#   scope      = azurerm_resource_group.rg_name.id
#   lock_level = "ReadOnly"
#   notes      = "This Resource Group is Read-Only"
# }