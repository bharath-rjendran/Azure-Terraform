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
variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}
variable "admin_username" {
  description = "The username for the virtual machine"
  type        = string
}
variable "admin_password" {
  description = "The password for the virtual machine"
  type        = string
}
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet in which to create the virtual machine"
  type        = string
}
variable "client_id" {}
variable "client_secret" {}
variable "aks_location" {}
variable "app_location" {}
variable "sql_admin_username" {}
variable "sql_admin_password" {}
variable "db_location" {}
variable "tenant_id" {}
variable "sm_location" {}
variable "msg_location" {}


