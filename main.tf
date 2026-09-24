terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.43.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_integer" "suffix" {
  count = var.rg_count
  min   = 10000
  max   = 99999
}

resource "azurerm_resource_group" "RUSH_RG" {
  count    = var.rg_count
  name     = "rush${random_integer.suffix[count.index].result}"
  location = "eastus"
  tags = {
    costcenter = "ABC-12345"
    iteration  = "Resource Group number ${count.index}"
  }
}
