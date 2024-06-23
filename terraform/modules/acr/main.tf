resource "azurerm_resource_group" "acr_rg" {
  name     = var.acr_rg_name
  location = var.acr_rg_location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku = "Standard"
  tags = {
    env = "Test"
  }
}

