#!/bin/bash

# Update system packages
sudo dnf update -y

# Install Docker (required for Kind)
sudo dnf install -y docker

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group for permission
sudo usermod -aG docker ec2-user

# Install kind binary
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64

chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Verify installation
kind version

echo "✅ Kind installed. You can create a cluster using 'kind create cluster'."
