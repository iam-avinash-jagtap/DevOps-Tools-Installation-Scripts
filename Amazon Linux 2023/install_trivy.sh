#!/bin/bash

# Update system packages
sudo dnf update -y  # Keeps system up-to-date

# Download latest Trivy release binary for Linux AMD64
TRIVY_VERSION=$(curl -s https://api.github.com/repos/aquasecurity/trivy/releases/latest | grep tag_name | cut -d '"' -f 4)

sudo curl -L "https://github.com/aquasecurity/trivy/releases/download/${TRIVY_VERSION}/trivy_${TRIVY_VERSION#v}_Linux-64bit.tar.gz" -o trivy.tar.gz  
# Downloads the latest Trivy tarball

# Extract the tarball
tar zxvf trivy.tar.gz

# Move the binary to /usr/local/bin and make executable
sudo mv trivy /usr/local/bin/  
sudo chmod +x /usr/local/bin/trivy

# Clean up
rm trivy.tar.gz

# Verify installation
trivy --version  # Shows Trivy version

echo "✅ Trivy installation completed."
