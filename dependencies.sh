
### `dependencies.sh`

# This script installs all necessary dependencies on the local machine.

```sh
#!/bin/bash

# Install Terraform
echo "Installing Terraform..."
curl -O https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
unzip terraform_1.0.11_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.0.11_linux_amd64.zip

# Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

echo "Dependencies installed successfully."
