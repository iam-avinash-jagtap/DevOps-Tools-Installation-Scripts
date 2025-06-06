#!/bin/bash

# Update packages
sudo apt update -y && sudo apt install -y wget unzip

# Download latest Terraform zip
TERRAFORM_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip Terraform binary
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Cleanup
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify installation
terraform -version

echo "✅ Terraform installed."
