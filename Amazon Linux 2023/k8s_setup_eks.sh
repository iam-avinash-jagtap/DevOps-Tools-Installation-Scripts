#!/bin/bash

# Update system packages
sudo dnf update -y

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Verify AWS CLI
aws --version

# Install kubectl (already covered but added here for completeness)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

# Verify kubectl
kubectl version --client --short

# Install eksctl (EKS cluster CLI)
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Verify eksctl
eksctl version

echo "✅ AWS CLI, kubectl, and eksctl installed."
echo "Use 'eksctl create cluster' to create an EKS cluster."
