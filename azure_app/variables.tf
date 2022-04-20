

variable "location" {
  description = "location of the zone"
  default = "eastus"
}

variable "skutier" {
  description = "sku tier to be mentioned"
  default = "Free"
}

variable "skusize" {
  description = "sku size o be mentioned"
  default = "F1"
}

variable "repourl" {
  description = "url of the code in repo"
  default = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
}

variable "branch" {
    
    description = "the branch in which the code is present"
    default = "master"
}