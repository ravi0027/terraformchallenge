variable "vpc_cidr" {
  description = "cidr block for vpc"
  type        = string
}
variable "vpc_name" {
  description = "vpc tag"
  type        = string
}
variable "subnet_cidr" {
  description = "cidr block for the subnet "
  type        = string
}
variable "subnet_zone" {
  description = "aviable zone for the subnet "
  type        = string
}
variable "subnet_name" {
  description = "subnet tag"
  type        = string
}
variable "subnet_group_name" {
  description = "name of the subnet_group"
  type        = string
}
variable "cluster_id" {
  description = "cluster id for group identifier"
  type        = string
}

variable "cluster_engine" {
  description = "Name of the cache engine to be used for this cache cluster"
  type        = string
}
variable "cluster_node_type" {
  description = "the instance class used for cluster node type"
  type        = string
}
variable "engine_version" {
  description = "version for the engine"
  type        = string
}
variable "port" {
  description = "name of the port in cluster"
  type        = number
}
variable "security_group_name" {
  description = "name of the security group name"
  type        = string

}
variable "elasticache_security_group_name" {
  description = "name of the elasticache security group name"
  type        = string
}










