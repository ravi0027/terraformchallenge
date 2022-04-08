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

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "azurerm_key_vault" {
  name                       = var.azurerm_key_vault_name
  location                   = azurerm_resource_group.rg_name.location
  resource_group_name        = azurerm_resource_group.rg_name.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = var.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions

    secret_permissions = var.secret_permissions
  }
}

resource "azurerm_key_vault_secret" "kv_secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.azurerm_key_vault.id
}