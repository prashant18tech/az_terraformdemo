# Resource Group
resource "azurerm_resource_group" "rg" {
  count    = var.create_rg ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "stg" {
  count                    = var.create_storage ? 1 : 0
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg[0].name
  location                 = azurerm_resource_group.rg[0].location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  count                = var.create_vnet ? 1 : 0
  name                 = var.vnet_name
  address_space        = var.vnet_address_space
  location             = azurerm_resource_group.rg[0].location
  resource_group_name  = azurerm_resource_group.rg[0].name
}

# Subnet (only if VNet is created)
resource "azurerm_subnet" "subnet" {
  count                = var.create_vnet ? 1 : 0
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg[0].name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefixes     = [var.subnet_prefix]
}
