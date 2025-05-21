terraform {
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "networking" {
  depends_on          = [module.resource_group]
  source              = "./modules/networking"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  address_space       = var.address_space
  subnet_names        = var.subnet_names
  subnet_cidr_blocks  = var.subnet_cidr_blocks
}

module "compute" {
  depends_on          = [module.networking]
  source              = "./modules/compute"
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = lookup(module.networking.subnet_ids, var.subnet_name, null)
  environment         = var.environment
  client_id           = var.client_id
  client_secret       = var.client_secret
  aks_location = var.aks_location
  app_location = var.app_location
}

module "storage" {
  depends_on          = [module.resource_group]
  source              = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  environment = var.environment
}

module "database" {
  depends_on = [ module.resource_group ]
  source             = "./modules/database"
  resource_group_name = var.resource_group_name
  db_location = var.db_location
  environment = var.environment
  sql_admin_username = var.admin_username
  sql_admin_password = var.sql_admin_password
}

module "security_monitoring" {
  depends_on = [ module.resource_group ]
  source             = "./modules/security_monitoring"
  resource_group_name = var.resource_group_name
  sm_location = var.sm_location
  environment = var.environment
  tenant_id = var.tenant_id
}

module "messaging" {
  depends_on = [ module.resource_group ]
  source             = "./modules/messaging"
  resource_group_name = var.resource_group_name
  msg_location = var.msg_location
  environment = var.environment
}
