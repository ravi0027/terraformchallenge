resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = "resource_group_location"
}

resource "azurerm_virtual_network" "test" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_subnet" "test" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.test.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "test" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  allocation_method   = var.allocation_method
}

resource "azurerm_lb" "test" {
  name                = var.lb_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  frontend_ip_configuration {
    name                 = var.lb_frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.test.id
  }
}

resource "azurerm_lb_backend_address_pool" "test" {
  loadbalancer_id = azurerm_lb.test.id
  name            = var.lb_backend_address_pool_name
}

resource "azurerm_network_interface" "test" {
  count               = 2
  name                = "acctni${count.index}"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  ip_configuration {
    name                          = var.network_interface_ip_configuration_name
    subnet_id                     = azurerm_subnet.test.id
    private_ip_address_allocation =var.network_interface_ip_configuration__private_ip_address_allocation
  }
}

resource "azurerm_availability_set" "avset" {
  name                         = var.availability_set_name
  location                     = azurerm_resource_group.test.location
  resource_group_name          = azurerm_resource_group.test.name
  platform_fault_domain_count  = var.availability_set_platform_fault_domain_count
  platform_update_domain_count = var.availability_set_platform_update_domain_count
  managed                      = var.availability_set_managed
}

resource "azurerm_virtual_machine" "test" {
  count                 = 2
  name                  = "acctvm${count.index}"
  location              = azurerm_resource_group.test.location
  availability_set_id   = azurerm_availability_set.avset.id
  resource_group_name   = azurerm_resource_group.test.name
  network_interface_ids = [element(azurerm_network_interface.test.*.id, count.index)]
  vm_size               = var.vm_size

  storage_image_reference {

    publisher = var.storage_image_reference_publisher
    offer     = var.storage_image_reference_offer
    sku       = var.storage_image_reference_sku
    version   = var.storage_image_reference_version
  }

  storage_os_disk {
    name                      = var.storage_os_disk_name
    caching                   = var.storage_os_disk_caching
    create_option             = var.storage_os_disk_create_option
  }

  storage_data_disk {

    name                      = var.storage_data_disk_name
    disk_size_gb              = var.storage_data_disk_disk_size_gb
    create_option             = var.storage_data_disk_create_option
    lun                       = var.storage_data_disk_lun
  }

  os_profile {
    
    computer_name  = var.os_profile_computer_name
    admin_username = var.os_profile_admin_username
    admin_password = var.os_profile_admin_password
  }

  os_profile_linux_config {
  
    disable_password_authentication = var.os_profile_linux_config_disable_password_authentication
  }
  tags = var.tags
}