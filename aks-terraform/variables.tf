variable "azurerm_client_id" {
    type = string
    description = "Client ID"
}

variable "azurerm_client_secret" {
    type = string
    description = "Client Secret"
}

variable "azurerm_subscription_id" {
    type = string
    description = "Subscription ID"
}

variable "azurerm_tentant_id" {
    type = string
    description = "Tenant ID"
}

variable "resource_group_name" {
    type = string
    default = "dev-pipe"
    description = "Name of the resource group of Network Resources"
}

variable "location" {
    type = string
    default = "uksouth"
    description = "Specifies the region group of all Resources"
}

variable "vnet_address_space" {
    type = list(string)
    default = ["10.0.0.0/16"]
    description = "Specifies the address space for Virtual Network"
}

variable "aks_cluster_name" {
    type = string
    default = "dev-pipe-kub"
    description = "Name of the AKS cluster"
}

variable "dns_prefix" {
    type = string
    description = "Defines the DNS prefix of the cluster"
}

variable "kubernetes_version" {
    type = string
    description = "Specifies the version of Kubernetes to be used by the cluster"
}

variable "source_pref" {
    type = string
    description = "Specifies the Host's Public IP for allowing connection to the Public IP"
}