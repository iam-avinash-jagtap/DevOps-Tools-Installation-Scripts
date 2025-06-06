#!/bin/bash

# Update packages
sudo apt update -y

# Download latest kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make binary executable
chmod +x kubectl

# Move to system path
sudo mv kubectl /usr/local/bin/kubectl

# Verify installation
kubectl version --client --short

echo "✅ kubectl installed."
