#!/bin/bash

# Fetch the instance ID from Terraform state
instance_id=$(terraform output -raw instance_id)

# Stop the EC2 instance
echo "Stopping the Minecraft server..."
aws ec2 stop-instances --instance-ids $instance_id

echo "Server stopped."
