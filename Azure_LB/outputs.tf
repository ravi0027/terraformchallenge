output "loadbalancer_id" {
  value = azurerm_lb.lb[*].id
}

