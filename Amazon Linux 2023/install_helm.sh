#!/bin/bash

# Update system packages
sudo dnf update -y  # Keep system updated

# Download latest Helm release
HELM_VERSION=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)

curl -LO https://get.helm.sh/helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Extract the tarball
tar -zxvf helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Move helm binary to /usr/local/bin
sudo mv linux-amd64/helm /usr/local/bin/helm

# Cleanup extracted files
rm -rf linux-amd64 helm-${HELM_VERSION#v}-linux-amd64.tar.gz

# Verify installation
helm version --short

echo "✅ Helm installation completed."
