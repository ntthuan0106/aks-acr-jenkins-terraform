module "acr" {
  source = "./modules/acr"
  acr_name = "testAcrOfThuan"
  acr_rg_name = "AcrRg"
}

module "aks" {
  source = "./modules/aks-clusters"
  k8s_cluster_name = "testK8sCluster"
  cluster_rg_name = "AksRg"
}

resource "azurerm_role_assignment" "example" {
  principal_id                     = module.aks.principal_id
  role_definition_name             = "AcrPull"
  scope                            = module.acr.acr_id
  skip_service_principal_aad_check = true
}