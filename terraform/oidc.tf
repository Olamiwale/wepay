
resource "azurerm_user_assigned_identity" "github_identity" {
  name                = "github-oidc-identity"
  resource_group_name = "de_paul_RG"
  location            = "eastus"
}


resource "azurerm_federated_identity_credential" "github_oidc" {
  name                = "github_actions"
  resource_group_name = var.resource_group
  parent_id           = azurerm_user_assigned_identity.github_identity.id
  issuer              = "https://token.actions.githubusercontent.com"
  audience            = ["api://AzureADTokenExchange"]
  subject             = "repo:Olamiwale/wepay:ref:refs/heads/main"
}


resource "azurerm_role_assignment" "sub_reader" {
  principal_id         = azurerm_user_assigned_identity.github_identity.principal_id
  role_definition_name = "Contributor"
  scope                = "/subscriptions/8acdb728-9561-4071-afaa-cf8227e09d2f"
}



resource "azurerm_role_assignment" "admin" {
  principal_id         = azurerm_user_assigned_identity.github_identity.principal_id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  scope                = azurerm_kubernetes_cluster.aks.id
}