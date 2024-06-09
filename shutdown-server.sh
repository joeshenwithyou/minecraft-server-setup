#!/bin/bash

# Print the current directory
echo "Current directory: $(pwd)"

# Print the contents of the state file
echo "Terraform state file contents:"
cat terraform.tfstate

# Print the value of the output variable instance_id
INSTANCE_ID=$(terraform output -raw instance_id)
echo "Instance ID: $INSTANCE_ID"

# Use AWS CLI to stop the instance
aws ec2 stop-instances --instance-ids $INSTANCE_ID
