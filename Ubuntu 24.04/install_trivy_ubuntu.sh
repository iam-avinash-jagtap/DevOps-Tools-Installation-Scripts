#!/bin/bash

# Update packages
sudo apt update -y

# Download latest Trivy binary
TRIVY_VERSION=$(curl -s https://api.github.com/repos/aquasecurity/trivy/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/aquasecurity/trivy/releases/download/${TRIVY_VERSION}/trivy_${TRIVY_VERSION#v}_Linux-64bit.deb

# Install the downloaded package
sudo dpkg -i trivy_${TRIVY_VERSION#v}_Linux-64bit.deb

# Remove the .deb package
rm trivy_${TRIVY_VERSION#v}_Linux-64bit.deb

# Verify installation
trivy --version

echo "✅ Trivy installed successfully."
