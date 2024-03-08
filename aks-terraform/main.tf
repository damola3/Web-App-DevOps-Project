terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.94.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  client_id       = var.azurerm_client_id
  client_secret   = var.azurerm_client_secret
  subscription_id = var.azurerm_subscription_id
  tenant_id       = var.azurerm_tentant_id
  features {}
}

module "networking" {
    source               = "./networking-module"
    resource_group_name  = var.resource_group_name
    location             = var.location
    vnet_address_space   = var.vnet_address_space
    source_pref          = var.source_pref
}

output "vnet_id" {
  value = module.networking.vnet_id
  description = "ID of vnet"
}

output "control_plane_subnet_id" {
  value = module.networking.control_plane_subnet_id
  description = "ID of the control plane subnet"
}

output "worker_node_subnet_id" {
  value = module.networking.worker_node_subnet_id
  description = "ID of the worker node subnet"
}

output "networking_resource_group_name" {
  value = module.networking.networking_resource_group_name
  description = "Name of the resource group, which contains networking resources"
}

output "aks_nsg_id" {
  value = module.networking.aks_nsg_id
  description = "ID of Network Security Group"
}

module "aks_cluster" {
    source                          = "./aks-cluster-module"
    aks_cluster_name                = var.aks_cluster_name
    cluster_location                = var.location
    networking_resource_group_name  = var.resource_group_name
    dns_prefix                      = var.dns_prefix
    kubernetes_version              = var.kubernetes_version
    service_principal_client_id     = var.azurerm_client_id
    service_principal_client_secret = var.azurerm_client_secret
    control_plane_subnet_id         = module.networking.control_plane_subnet_id
    vnet_id                         = module.networking.vnet_id
    worker_node_subnet_id           = module.networking.worker_node_subnet_id
}

output "aks_cluster_name" {
  value = module.aks_cluster.aks_cluster_name
  description = "Name of the Kubernetes Cluster"
}

output "aks_cluster_id" {
  value = module.aks_cluster.aks_cluster_id
  description = "ID of the Kubernetes Cluster"
}

output "aks_kubeconfig" {
  value = module.aks_cluster.aks_kubeconfig
  description = "Configuration file of the cluster"
  sensitive = true
}