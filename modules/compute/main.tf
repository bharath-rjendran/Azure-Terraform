resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic.id]
  depends_on            = [azurerm_network_interface.nic]

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb      = 30
  }
}

#Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}"
  location            = var.aks_location
  resource_group_name = var.resource_group_name
  dns_prefix = "akspoc"
  kubernetes_version = "1.31.7"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_b2pls_v2"
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = var.environment
  }
}


#App Services

resource "azurerm_linux_web_app" "app_service" {
  name                = "app-service-${var.environment}"
  #name                = "app-service-poc"
  location            = var.app_location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.app_service_plan.id
  https_only      = true

  site_config {
    always_on = false
  }

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "app-service-plan-${var.environment}"
  location            = var.app_location
  resource_group_name = var.resource_group_name
  sku_name = "F1"
  os_type  = "Linux"
}