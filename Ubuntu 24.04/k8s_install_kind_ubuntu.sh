#!/bin/bash

# Update packages
sudo apt update -y && sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group for permissions
sudo usermod -aG docker $USER

# Install kind binary
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64

chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Verify installation
kind version

echo "✅ Kind installed. Use 'kind create cluster' to start."
