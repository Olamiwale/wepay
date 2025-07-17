# Create azure container registry
resource "azurerm_container_registry" "acr" {
    name                = "depaulacr"
    resource_group_name = var.resource_group
    location            = var.location
    sku                 = "Basic"
    admin_enabled       = false
}


# Grant AKS Pull from ACR
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}