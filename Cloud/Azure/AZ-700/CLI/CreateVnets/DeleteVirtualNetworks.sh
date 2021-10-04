#!/bin/bash

# Delete resource groups
az group delete --name CoreServicesRG --yes
az group delete --name ManufacturingRG  --yes
az group delete --name ResearchRG  --yes

