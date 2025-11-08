# Output Resource Group Name
output "resource_group_name" {
  value       = azurerm_resource_group.rg[0].name
  description = "The name of the resource group"
  condition   = length(azurerm_resource_group.rg) > 0
}

# Output Storage Account Name
output "storage_account_name" {
  value       = azurerm_storage_account.stg[0].name
  description = "The name of the storage account"
  condition   = length(azurerm_storage_account.stg) > 0
}

# Output Storage Account Primary Endpoint
output "storage_account_primary_endpoint" {
  value       = azurerm_storage_account.stg[0].primary_blob_endpoint
  description = "The primary blob endpoint of the storage account"
  condition   = length(azurerm_storage_account.stg) > 0
}

# Output Virtual Network Name
output "vnet_name" {
  value       = azurerm_virtual_network.vnet[0].name
  description = "The name of the virtual network"
  condition   = length(azurerm_virtual_network.vnet) > 0
}

# Output Virtual Network Address Space
output "vnet_address_space" {
  value       = azurerm_virtual_network.vnet[0].address_space
  description = "The address space of the virtual network"
  condition   = length(azurerm_virtual_network.vnet) > 0
}

# Output Subnet Name
output "subnet_name" {
  value       = azurerm_subnet.subnet[0].name
  description = "The name of the subnet"
  condition   = length(azurerm_subnet.subnet) > 0
}

# Output Subnet Prefix
output "subnet_prefix" {
  value       = azurerm_subnet.subnet[0].address_prefixes
  description = "The subnet CIDR prefix"
  condition   = length(azurerm_subnet.subnet) > 0
}
