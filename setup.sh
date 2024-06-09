#!/bin/bash
cd $(dirname "$0")
terraform init
terraform apply -auto-approve

instance_ip=$(terraform output -raw instance_ip_addr)
echo "Minecraft server will be available at: $instance_ip"
