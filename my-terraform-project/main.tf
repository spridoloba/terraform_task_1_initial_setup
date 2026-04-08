terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testresource" {
  name     = "test-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "test" {
  name                     = "teststorageacc"
  resource_group_name      = azurerm_resource_group.testresource.name
  location                 = azurerm_resource_group.testresource.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}