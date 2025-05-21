variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create resources"
  type        = string
}
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}
variable "subnet_names" {
  description = "A map of subnets to create in the virtual network"
  type        = list(string)
}
variable "subnet_cidr_blocks" {
  description = "A map of CIDR blocks for the subnets"
  type        = list(string)
}
variable "environment" {
  description = "The environment for the networking resources (e.g., dev, staging, prod)"
  type        = string
}
