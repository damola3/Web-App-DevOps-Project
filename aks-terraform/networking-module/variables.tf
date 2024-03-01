variable "resource_group_name" {
    type = string
    default = "dev-pipe"
    description = "Name of the resource group of Network Resources"
}

variable "location" {
    type = string
    default = "uksouth"
    description = "Specifies the region group of Network Resources"
}

variable "vnet_address_space" {
    type = list(string)
    default = ["10.0.0.0/16"]
    description = "Specifies the address space for Virtual Network"
}

variable "source_pref" {
    type = string
    description = "Specifies the Host's Public IP for allowing connection to the Public IP"
}