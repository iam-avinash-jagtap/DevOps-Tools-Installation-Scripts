#!/bin/bash

# Update system packages
sudo dnf update -y  # Ensure system is up to date

# Download latest Argo CD CLI binary
ARGOCD_VERSION=$(curl -s https://api.github.com/repos/argoproj/argo-cd/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64

# Make binary executable
chmod +x argocd-linux-amd64

# Move to /usr/local/bin for global access
sudo mv argocd-linux-amd64 /usr/local/bin/argocd

# Verify installation
argocd version --client

echo "✅ Argo CD CLI installation completed."
