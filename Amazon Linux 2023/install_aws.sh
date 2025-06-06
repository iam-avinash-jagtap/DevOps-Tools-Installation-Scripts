#!/bin/bash

# Update the package repository
sudo dnf update -y  # Ensures all packages are up-to-date

# Install unzip and curl, required for downloading and extracting AWS CLI
sudo dnf install unzip curl -y

# Download the AWS CLI v2 installer ZIP
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
unzip awscliv2.zip

# Run the install script
sudo ./aws/install

# Verify the installation
aws --version  # This should show aws-cli version 2.x

# Clean up
rm -rf aws awscliv2.zip

echo "✅ AWS CLI installation completed."
