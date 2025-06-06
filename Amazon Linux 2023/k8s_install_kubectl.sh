#!/bin/bash

# Update system packages
sudo dnf update -y  # Ensure latest packages

# Download latest stable kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make kubectl executable
chmod +x kubectl

# Move kubectl to /usr/local/bin for global access
sudo mv kubectl /usr/local/bin/kubectl

# Verify installation
kubectl version --client --short

echo "✅ kubectl installation completed."
