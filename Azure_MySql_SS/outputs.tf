output "mysql_db_id" {
  value = azurerm_mysql_database.mysql_dbname.id
}

output "mysql_server_id" {
  value = azurerm_mysql_server.mysql_server_name.id
}