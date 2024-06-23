output "principal_id" {
  value = azurerm_kubernetes_cluster.aks-cluster.kubelet_identity[0].object_id
}
