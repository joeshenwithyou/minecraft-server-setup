#!/bin/bash

# Fetch the instance ID from Terraform state
instance_id=$(terraform output -raw instance_id)

# Start the EC2 instance
echo "Starting the Minecraft server..."
aws ec2 start-instances --instance-ids $instance_id

# Fetch the new public IP address after starting
instance_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
echo "Minecraft server is now running at: $instance_ip"
