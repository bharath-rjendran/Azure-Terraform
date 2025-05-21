
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "subnet" {
  count             = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr_blocks[count.index]]

  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.environment}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    environment = var.environment
  }
}

# resource "azurerm_public_ip" "public_ip" {
#   name                = "${var.environment}-public-ip"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = "Static"

#   tags = {
#     environment = var.environment
#   }
# }