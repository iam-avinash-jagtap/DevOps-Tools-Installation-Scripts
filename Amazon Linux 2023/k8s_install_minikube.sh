#!/bin/bash

# Update system packages
sudo dnf update -y

# Install dependencies
sudo dnf install -y conntrack iptables

# Download latest Minikube binary
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube
sudo mv minikube /usr/local/bin/

# Install Docker (driver for Minikube)
sudo dnf install -y docker

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

# Verify Minikube installation
minikube version

echo "✅ Minikube installed. Start your cluster with 'minikube start'."
