#!/bin/bash

# Update system packages
sudo dnf update -y  # Keep system updated

# Install unzip and curl if not installed (required for Terraform installation)
sudo dnf install unzip curl -y

# Download latest Terraform version
TERRAFORM_VERSION=$(curl -s https://api.releases.hashicorp.com/terraform/ | grep -oP 'terraform_\K[0-9.]+(?=.zip)' | head -1)

curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip the downloaded file
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Give executable permissions
sudo chmod +x /usr/local/bin/terraform

# Clean up zip file
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify installation
terraform version

echo "✅ Terraform installation completed."
