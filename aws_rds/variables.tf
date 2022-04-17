variable "dns_hostnames" {
    description = "To enable the dns hostname"
    type        = bool
}

variable "dns_support" {
    description = "To enable the dns support"
    type        = bool
  
}



variable "instance_class" {
    description = "Type of the instance"

  
}


variable "db_memory_size" {
  
    description = "To specify size of the db"
    type        = number
}


variable "db_engine" {
    description = "To specify differnt  db "
    type        = string
}

variable "db_version" {
    description = "To mention db version"

  
}

variable "user_name" {
    description = "To specify the user name"
    type        = string
  
}

variable "db_password" {
    description = "to specify the password for the user"
    
  
}