
output "vnet_name" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
}

# output "public_ip" {
#     description = "The ID of the public IP address"
#     value       = azurerm_public_ip.public_ip.ip_address
# }
output "networking_complete" {
  description = "A message indicating that the networking resources have been created"
  value       = true
}