#!/bin/bash
instance_id=$(terraform show -json | jq -r '.values.root_module.resources[] | select(.type=="aws_instance" and .name=="minecraft") | .values.id')
aws ec2 stop-instances --instance-ids $instance_id
echo "Server stopped."
