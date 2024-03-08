output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
  description = "Name of the Kubernetes Cluster"
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "ID of the Kubernetes Cluster"
}

output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Configuration file of the cluster"
}