terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.40.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.33.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 1.3.0"
    }
  }
}
