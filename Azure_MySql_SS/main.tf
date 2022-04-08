terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.99.0"
    }
  }

  required_version = "1.1.2"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.rg_region

}

resource "azurerm_mysql_server" "mysql_server_name" {
  name                = var.mysql_server_name
  location            = var.mysql_server_region
  resource_group_name = azurerm_resource_group.rg_name.name

  administrator_login          = var.mysql_server_admin_name
  administrator_login_password = var.mysql_server_pwd

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
  version    = var.mysql_version

  auto_grow_enabled                 = var.auto_grow_enable
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enable
  infrastructure_encryption_enabled = var.infrastructure_encryption_enable
  public_network_access_enabled     = var.public_network_access_enable
  ssl_enforcement_enabled           = var.ssl_enforcement_enable

}

resource "azurerm_mysql_database" "mysql_dbname" {
  name                = var.mysql_dbname
  resource_group_name = azurerm_resource_group.rg_name.name
  server_name         = azurerm_mysql_server.mysql_server_name.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}