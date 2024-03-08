variable "aks_cluster_name" {
    type = string
    default = "dev-pipe-kub"
    description = "Name of the AKS cluster"
}

variable "cluster_location" {
    type = string
    default = "uksouth"
    description = "Specifies the region group of the AKS cluster"
}

variable "dns_prefix" {
    type = string
    description = "Defines the DNS prefix of the cluster"
}

variable "kubernetes_version" {
    type = string
    description = "Specifies the version of Kubernetes to be used by the cluster"
}

variable "service_principal_client_id" {
    type = string
    description = "Client ID for the cluster's service principle"
}

variable "service_principal_client_secret" {
    type = string
    description = "Passowrd for the cluster's service principle"
}

# Networking Module Variables

variable "control_plane_subnet_id" {
  description = "ID of the control plane subnet"
}

variable "vnet_id" {
  description = "ID of vnet"
}

variable "worker_node_subnet_id" {
  description = "ID of the worker node subnet"
}

variable "networking_resource_group_name" {
  description = "Name of the resource group, which contains networking resources"
}