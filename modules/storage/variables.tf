variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create resources"
  type        = string
}
variable "environment" {
  description = "The environment for the networking resources (e.g., dev, staging, prod)"
  type        = string
}