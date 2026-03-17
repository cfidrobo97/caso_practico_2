resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "casopractico2dns"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2as_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  tags                              = var.tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}