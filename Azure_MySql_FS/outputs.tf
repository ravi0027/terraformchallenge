output "mysql_flexserver_id" {
  value = azurerm_mysql_flexible_server.mysql_flexserver
  sensitive = true
}