#!/bin/bash
instance_id=$(terraform show -json | jq -r '.values.root_module.resources[] | select(.type=="aws_instance" and .name=="minecraft") | .values.id')
aws ec2 start-instances --instance-ids $instance_id

instance_ip=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
echo "Minecraft server is now running at: $instance_ip"
