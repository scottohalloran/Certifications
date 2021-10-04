#!/bin/bash


# Create rsource groups
az group create --name CoreServicesRG --location westus
az group create --name ManufacturingRG --location northeurope
az group create --name ResearchRG --location westindia

# Create virtual networks

az network vnet create --name CoreServicesVnet  --resource-group CoreServicesRG --address-prefix 10.20.0.0/16
az network vnet create --name ManufacturingVnet --resource-group ManufacturingRG  --address-prefix 10.30.0.0/16
az network vnet create --name  ResearchVnet --resource-group ResearchRG --address-prefix 10.40.0.0/16

# Create Subnets
az network vnet subnet create  --name GatewaySubnet --resource-group CoreServicesRG --vnet-name CoreServicesVnet --address-prefixes 10.20.0.0/27
az network vnet subnet create  --name SharedServicesSubnet --resource-group CoreServicesRG --vnet-name CoreServicesVnet --address-prefixes 10.20.10.0/24
az network vnet subnet create  --name DatabaseSubnet --resource-group CoreServicesRG --vnet-name CoreServicesVnet --address-prefixes 10.20.20.0/24
az network vnet subnet create  --name PublicWebServiceSubnet --resource-group CoreServicesRG --vnet-name CoreServicesVnet --address-prefixes 10.20.30.0/24
###############################################################
az network vnet subnet create  --name ManufacturingSystemSubnet --resource-group ManufacturingRG --vnet-name ManufacturingVnet --address-prefixes  10.30.10.0/24
az network vnet subnet create  --name SensorSubnet1 --resource-group ManufacturingRG --vnet-name ManufacturingVnet --address-prefixes 10.30.20.0/24
az network vnet subnet create  --name SensorSubnet2 --resource-group ManufacturingRG --vnet-name ManufacturingVnet --address-prefixes 10.30.21.0/24
az network vnet subnet create  --name SensorSubnet3 --resource-group ManufacturingRG --vnet-name ManufacturingVnet --address-prefixes 10.30.22.0/24
###############################################################
az network vnet subnet create  --name ResearchSystemSubnet --resource-group ResearchRG --vnet-name ResearchVnet --address-prefixes 10.40.0.0/24

