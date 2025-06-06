#!/bin/bash

# Update system packages
sudo dnf update -y  # Update packages

# Install Java (required to run OWASP ZAP)
sudo dnf install java-17-amazon-corretto -y  # Java 17 is recommended for OWASP ZAP

# Download latest OWASP ZAP full release (Linux)
ZAP_VERSION=$(curl -s https://api.github.com/repos/zaproxy/zaproxy/releases/latest | grep tag_name | cut -d '"' -f 4)
ZAP_TAR="ZAP_${ZAP_VERSION#v}_Linux.tar.gz"

curl -L "https://github.com/zaproxy/zaproxy/releases/download/${ZAP_VERSION}/${ZAP_TAR}" -o $ZAP_TAR

# Extract the archive
tar -xvzf $ZAP_TAR

# Move the extracted folder to /opt and create symlink
sudo mv ZAP_${ZAP_VERSION#v}_Linux /opt/owasp_zap

sudo ln -s /opt/owasp_zap/zap.sh /usr/local/bin/zap.sh

# Clean up
rm $ZAP_TAR

echo "✅ OWASP ZAP installed. Run with 'zap.sh'"
