# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}


# Create rsource groups
resource "azurerm_resource_group" "group1" {
  name     = "CoreServicesRG"
  location = "westus"
}

resource "azurerm_resource_group" "group2" {
  name     = "ManufacturingRG"
  location = "northeurope"
}

resource "azurerm_resource_group" "group3" {
  name     = "ResearchRG"
  location = "westindia"
}


# Create virtual networks

resource "azurerm_virtual_network" "vnet1" {
  name                = "CoreServicesVnet"
  location            = azurerm_resource_group.group1.location
  resource_group_name = azurerm_resource_group.group1.name
  address_space       = ["10.20.0.0/16"]

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.20.0.0/27"
  }

  subnet {
    name           = "SharedServicesSubnet"
    address_prefix = "10.20.10.0/24"
  }

  subnet {
    name           = "DatabaseSubnet"
    address_prefix = "10.20.20.0/24"
  }

  subnet {
    name           = "PublicWebServiceSubnet"
    address_prefix = "10.20.30.0/24"
  }
}
###############################################################


resource "azurerm_virtual_network" "vnet2" {
  name                = "ManufacturingVnet"
  location            = azurerm_resource_group.group2.location
  resource_group_name = azurerm_resource_group.group2.name
  address_space       = ["10.30.0.0/16"]

  subnet {
    name           = "ManufacturingSystemSubnet"
    address_prefix = "10.30.10.0/24"
  }

  subnet {
    name           = "SensorSubnet1"
    address_prefix = "10.30.20.0/24"
  }

  subnet {
    name           = "SensorSubnet2"
    address_prefix = "10.30.21.0/24"
  }

  subnet {
    name           = "SensorSubnet3"
    address_prefix = "10.30.22.0/24"
  }
}
###############################################################


resource "azurerm_virtual_network" "vnet3" {
  name                = "ResearchVnet"
  location            = azurerm_resource_group.group3.location
  resource_group_name = azurerm_resource_group.group3.name
  address_space       = ["10.40.0.0/16"]

  subnet {
    name           = "ResearchSystemSubnet"
    address_prefix = "10.40.0.0/24"
  }


}
###############################################################
