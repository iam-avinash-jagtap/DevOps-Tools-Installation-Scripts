#!/bin/bash

# Update packages
sudo apt update -y && sudo apt install -y curl tar

# Download latest Helm release
HELM_VERSION=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://get.helm.sh/helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Extract archive
tar -zxvf helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Move helm binary
sudo mv linux-amd64/helm /usr/local/bin/helm

# Clean up extracted files
rm -rf linux-amd64 helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Verify installation
helm version --short

echo "✅ Helm installed."
