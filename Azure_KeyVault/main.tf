provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg_name
  location = var.rg_region

}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.rg_name.location
  resource_group_name         = azurerm_resource_group.rg_name.name
  enabled_for_disk_encryption = var.disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


resource "azurerm_management_lock" "rglock" {
  name       = "resource-level-lock"
  scope      = azurerm_resource_group.rg_name.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}

resource "azurerm_monitor_diagnostic_setting" "logging" {
  name               = "logging"
  target_resource_id = azurerm_key_vault.key_vault.id
  #storage_account_id = data.azurerm_storage_account.example.id


  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}