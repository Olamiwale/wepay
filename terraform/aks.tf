resource "azurerm_kubernetes_cluster" "aks" {
    name = "depaulaks"
    resource_group_name = "de_paul_RG"
    location = var.location
    dns_prefix = "depaulaks"


    default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

   identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled       = true
  workload_identity_enabled = true 


  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

}