variable "name" {
  description = "Specifies the name of the Virtual Machine."
  type        = string
}
// variable "resource_group_name" {
//   description = "Specifies the name of the Resource Group in which the Virtual Machine should exist."
//   type        = string
// }
// variable "location" {
//   description = "Specifies the Azure Region where the Virtual Machine exists."
//   type        = string
// }
variable "network_interface_ids" {
  description = "A list of Network Interface ID's which should be associated with the Virtual Machine."
  type        = list(string)
}
variable "os_profile_linux_config_disable_password_authentication" {
  description = " Specifies whether password authentication should be disabled."
  type        = bool
}
variable "os_profile_linux_config_ssh_keys_key_data" {
  description = "he Public SSH Key which should be written to the path"
  type        = string
}
variable "os_profile_linux_config_ssh_keys__path" {
  description = "The path of the destination file on the virtual machine."
  type        = string
}
variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
  type        = string
}
variable "availability_set_id" {
  description = "The ID of the Availability Set in which the Virtual Machine should exist."
  type        = string
}
variable "boot_diagnostics_enabled" {
  description = "srf"
  type        = string
}
variable "boot_diagnostics_storage_uri" {
  description = "sf"
  type        = string
}
variable "additional_capabilities_ultra_ssd_enabled" {
  description = "Should Ultra SSD disk be enabled for this Virtual Machine?"
  type        = string
}
variable "delete_os_disk_on_termination" {
  description = " Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed?"
  type        = bool
}
variable "delete_data_disks_on_termination" {
  description = " Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed? "
  type        = bool
}
variable "identity_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Virtual Machine. "
  type        = string
}
variable "identity_identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Virtual Machine."
  type        = list(string)
}
variable "os_profile_computer_name" {
  description = " Specifies the name of the Virtual Machine."
  type        = string
}
variable "os_profile_admin_username" {
  description = " Specifies the name of the local administrator account."
  type        = string
}
variable "os_profile_admin_password" {
  description = "The password associated with the local administrator account."
  type        = string
}
variable "os_profile_custom_data" {
  description = "Specifies custom data to supply to the machine."
  type        = string
}
variable "os_profile_secrets_source_vault_id" {
  description = "Specifies the ID of the Key Vault to use."
  type        = string
}
variable "os_profile_secrets_vault_certificates_certificate_url" {
  description = "The ID of the Key Vault Secret. "
  type        = string
}
variable "os_profile_secrets_vault_certificates_certificate_store" {
  description = "Specifies the certificate store on the Virtual Machine."
  type        = string
}
variable "plan_name" {
  description = "Specifies the name of the image from the marketplace."
  type        = string
}
variable "plan_publisher" {
  description = "Specifies the publisher of the image."
  type        = string
}
variable "plan_product" {
  description = "Specifies the product of the image from the marketplace."
  type        = string
}
variable "primary_network_interface_id" {
  description = "The ID of the Network Interface (which must be attached to the Virtual Machine) which should be the Primary Network Interface for this Virtual Machine."
  type        = string
}
variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group to which this Virtual Machine should be assigned."
  type        = string
}
variable "storage_data_disk_name" {
  description = "The name of the Data Disk."
  type        = string
}
variable "storage_data_disk_caching" {
  description = "Specifies the caching requirements for the Data Disk. "
  type        = string
}
variable "storage_data_disk_disk_size_gb" {
  description = "Specifies the size of the data disk in gigabytes."
  type        = number
}
variable "storage_data_disk_create_option" {
  description = "pecifies how the data disk should be created. "
  type        = string
}
variable "storage_data_disk_lun" {
  description = "Specifies the logical unit number of the data disk. "
  type        = string
}
variable "storage_data_disk_write_accelerator_enabled" {
  description = "Specifies if Write Accelerator is enabled on the disk. "
  type        = string
}
variable "storage_image_reference_publisher" {
  description = "Specifies the publisher of the image used to create the virtual machine."
  type        = string
}
variable "storage_image_reference_offer" {
  description = "Specifies the offer of the image used to create the virtual machine. "
  type        = string
}
variable "storage_image_reference_sku" {
  description = "Specifies the SKU of the image used to create the virtual machine. "
  type        = string
}
variable "storage_image_reference_version" {
  description = "Specifies the version of the image used to create the virtual machine. "
  type        = string
}
variable "storage_os_disk_name" {
  description = "Specifies the name of the OS Disk."
  type        = string
}
variable "storage_os_disk_caching" {
  description = "Specifies the caching requirements for the OS Disk."
  type        = string
}
variable "storage_os_disk_create_option" {
  description = "Specifies how the OS Disk should be created."
  type        = string
}
variable "storage_os_disk_disk_size_gb" {
  description = "Specifies the size of the OS Disk in gigabytes."
  type        = number
}
variable "storage_os_disk_image_uri" {
  description = "Specifies the Image URI in the format."
  type        = string
}
variable "storage_os_disk_os_type" {
  description = "Specifies the Operating System on the OS Disk."
  type        = string
}
variable "storage_os_disk_write_accelerator_enabled" {
  description = "Specifies if Write Accelerator is enabled on the disk. "
  type        = string
}
variable "tags" {
  description = "A mapping of tags to assign to the Virtual Machine."
  type        = map(string)
}
variable "zones" {
  description = "A list of a single item of the Availability Zone which the Virtual Machine should be allocated in."
  type        = list(string)
}



//resource group

variable "resource_group_name" {
  description = "The Name which should be used for this resource group"
  type = string
}

variable "resource_group_location"{
  description = "The azure region where the Resource group should exist."
  type = string 
}

//virtual_netwpork

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type = string
}
variable "virtual_network_address_space"{
  description = "The address spacce that is used the virtual network."
  type =list(string)

}

//subnet

variable "subnet_name"{
  description = "The name of the subnet."
  type = string

}
variable "subnet_address_prefixes"{
  description = "The address prefixes to use for the subnet."
  type = list(string)
}


//public_ip
variable "public_ip_name"{
  description = "Specifies the name of the public ip."
  type = string
}

variable "allocation_method"{
  description = "Defines the allocation method for this IP address."
  type = string
}

//lb
variable "lb_name"{
  description = "Specifies the name of the Load Balancer."
  type = string
}
variable "lb_frontend_ip_configuration_name"{
  description = "Specifies the name of the frontend ip configuration."
  type = string 
}

//lb_backend_address_pool

variable "lb_backend_address_pool_name" {
  description = "Specifies the name of the Backend Address Pool."
  type = string
}

//network_interface

variable "network_interface_count" {
  description = "Count of network interfaces to be created."
  type = number
}

variable "network_interface_ip_configuration_name" {
  description = "A name used for this IP Configuration."
  type = string
}
variable "network_interface_ip_configuration__private_ip_address_allocation" {
  description = "The IP Version to use."
  type = string
}

//managed_disk
variable "managed_disk_storage_account_type" {
  description = "Specifies the name of the Managed Disk. "
  type = string
}

variable "managed_disk_create_option" {
  description = "The method to use when creating the managed disk. "
  type=string
}
variable "managed_disk_disk_size_gp" {
  description = "Specifies the size of the managed disk to create in gigabytes."
  type = string
}

//availability_set
variable "availability_set_name" {
  description = "Specifies the name of the availability set."
  type  = string
}
variable "availability_set_platform_fault_domain_count" {
  description = " Specifies the number of fault domains that are used. "
  type = number
}
variable "availability_set_platform_update_domain_count" {
  description = "Specifies the number of update domains that are used. "
  type = number
}

variable "availability_set_managed" {
  description = "Specifies whether the availability set is managed or not."
  type = bool
}

