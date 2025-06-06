#!/bin/bash

# Update packages
sudo apt update -y && sudo apt upgrade -y

# Install dependencies
sudo apt install -y conntrack iptables docker.io

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group
sudo usermod -aG docker $USER

# Download Minikube binary
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube
sudo mv minikube /usr/local/bin/

# Verify Minikube
minikube version

echo "✅ Minikube installed. Use 'minikube start' to launch cluster."
