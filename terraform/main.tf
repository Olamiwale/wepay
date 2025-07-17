terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">= 3.44.0"
        }
    }

    required_version = ">= 1.2.0"
}



provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}



resource "azurerm_resource_group" "rg" {
    name     = var.resource_group
    location = var.location
}

resource "null_resource" "get_kubeconfig" {
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_kubernetes_cluster.aks.resource_group_name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
  }
}

data  "azurerm_client_config" "current" {}