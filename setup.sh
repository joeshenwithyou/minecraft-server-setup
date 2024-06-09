#!/bin/bash

# Navigate to the Terraform directory
cd $(dirname "$0")

# Initialize and apply Terraform configuration
echo "Setting up infrastructure with Terraform..."
terraform init
terraform apply -auto-approve

# Extract the public IP address of the instance
instance_ip=$(terraform output -raw instance_ip_addr)
echo "Minecraft server will be available at: $instance_ip"

# Run additional server configuration script
echo "Configuring server..."
./server.sh

echo "Setup complete."
