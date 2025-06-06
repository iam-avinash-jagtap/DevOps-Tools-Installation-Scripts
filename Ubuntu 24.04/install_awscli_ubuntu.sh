#!/bin/bash

# Update package lists
sudo apt update -y

# Install unzip and curl dependencies
sudo apt install -y unzip curl

# Download AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip installer
unzip awscliv2.zip

# Run installer
sudo ./aws/install

# Remove installer files
rm -rf awscliv2.zip aws

# Verify AWS CLI installation
aws --version

echo "✅ AWS CLI installed successfully."
