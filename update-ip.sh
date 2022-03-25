#!/bin/bash

# Public IP address
IP="52.225.79.22"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-573311_fabmedical-573311_westus"

# Name to associate with public IP address
DNSNAME="fabmedical-573311-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME