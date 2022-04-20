variable "region" {
  default = "ap-south-1" 
  description = "region where ec2 instance created"
}

variable "access_key" {
    default = ""
    description = "access key"
}

variable "secret_key" {
    default = ""
    description = "secret key"
}

variable "ec2instance" {
    default = "ami-0851b76e8b1bce90b"
    description = "ami id of an instance"
}

variable "instancetype" {
  default = "t2.micro"
  description = "instance type"
}

variable "az" {
  default = "ap-south-1a"
  description = "availability zone of subnet and the ec2 instance should be the same"
}

variable "keyname" {
  default = "sree"
  description = "keyname created in the console"
}

variable "deviceindex" {
  default = 0
  description = "device index of network interface"

}
