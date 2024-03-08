output "vnet_id" {
  value = azurerm_virtual_network.vn1.id
  description = "ID of vnet"
}

output "control_plane_subnet_id" {
  value = azurerm_subnet.cps.id
  description = "ID of the control plane subnet"
}

output "worker_node_subnet_id" {
  value = azurerm_subnet.wns.id
  description = "ID of the worker node subnet"
}

output "networking_resource_group_name" {
  value = azurerm_resource_group.rg1.name
  description = "Name of the resource group, which contains networking resources"
}

output "aks_nsg_id" {
  value = azurerm_network_security_group.nsg1.id
  description = "ID of Network Security Group"
}