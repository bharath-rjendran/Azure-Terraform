variable "vm_name" {
    description = "The name of the virtual machine"
    type        = string
}
variable "location" {
    description = "The Azure region where resources will be created"
    type        = string
}
variable "resource_group_name" {
    description = "The name of the resource group in which to create resources"
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
variable "subnet_id" {
    description = "The ID of the subnet in which to create the virtual machine"
    type        = string
}
variable "environment" {
  type    = string
}
variable "client_id" {}
variable "client_secret" {}
variable "aks_location" {}
variable "app_location" {}