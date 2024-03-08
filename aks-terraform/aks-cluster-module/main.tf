
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.networking_resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  network_profile {
    network_plugin = "azure"
    service_cidr = "10.0.0.0/24"
    dns_service_ip = "10.0.0.2"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    enable_auto_scaling = true
    min_count = 1
    max_count = 3
    pod_subnet_id = var.control_plane_subnet_id
    vnet_subnet_id = var.worker_node_subnet_id
  }

      tags = {
    Environment = "Production"
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }
}