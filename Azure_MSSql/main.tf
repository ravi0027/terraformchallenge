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

resource "azurerm_management_lock" "kv_lock" {
  name       = "resource-ip"
  scope      = azurerm_key_vault.key_vault.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}

}
resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storageaccname
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "mssql_server_name" {
  name                         = var.mssql_server_name
  resource_group_name          = azurerm_resource_group.rg_name.name
  location                     = azurerm_resource_group.rg_name.location
  version                      = var.db_version
  administrator_login          = var.ms_admin
  administrator_login_password = var.ms_pwd
}

resource "azurerm_mssql_database" "db_name" {
  name           = var.db_name
  server_id      = azurerm_mssql_server.mssql_server_name.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.max_size_gb
  read_scale     = var.read_scale
  sku_name       = var.sku_name
  zone_redundant = var.zone_redundant

  #   extended_auditing_policy {
  #     storage_endpoint                        = azurerm_storage_account.storage_acc.primary_blob_endpoint
  #     storage_account_access_key              = azurerm_storage_account.storage_acc.primary_access_key
  #     storage_account_access_key_is_secondary = true
  #     retention_in_days                       = var.retention_days
  #   }


  tags = {
    name = "mssql_database"
  }

}

resource "azurerm_management_lock" "rglock" {
  name       = "resource-group-level"
  scope      = azurerm_resource_group.rg_name.id
  lock_level = "ReadOnly"
  notes      = "This Resource Group is Read-Only"
}