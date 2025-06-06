#!/bin/bash

# Update packages
sudo apt update -y && sudo apt install -y curl

# Download latest Argo CD CLI binary
ARGOCD_VERSION=$(curl -s https://api.github.com/repos/argoproj/argo-cd/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64

# Make executable and move binary
chmod +x argocd-linux-amd64
sudo mv argocd-linux-amd64 /usr/local/bin/argocd

# Verify installation
argocd version --client

echo "✅ Argo CD CLI installed."
