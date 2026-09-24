terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.43.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}


resource "azurerm_resource_group" "RUSH_RG" {
  name = "rush${random_integer.suffix.result}"
  location = "eastus"
  count = var.rg_count
tags = {
    costcenter = "ABC-12345"
    iteration = "Resource Group number ${count.index}"
     }
}
