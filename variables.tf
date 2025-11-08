variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "demo-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["192.168.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "demo-subnet"
}

variable "subnet_prefix" {
  description = "Subnet prefix"
  type        = string
  default     = "192.168.1.0/24"
}

variable "create_rg" {
  description = "Create Resource Group if it does not exist"
  type        = bool
  default     = true
}

variable "create_storage" {
  description = "Create Storage Account if it does not exist"
  type        = bool
  default     = true
}

variable "create_vnet" {
  description = "Create Virtual Network if it does not exist"
  type        = bool
  default     = true
}
