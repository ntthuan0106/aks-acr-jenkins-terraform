resource "azurerm_resource_group" "aks_rg" {
  name     = var.cluster_rg_name
  location = var.aks_location
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = var.k8s_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "Thuan20521995"

  sku_tier = "Free"
  
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    os_sku = "Ubuntu"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.28.9"

  tags = {
    Environment = "Test"
  }
}

