#!/bin/bash

# Update packages
sudo apt update -y

# Install Java (required for OWASP ZAP)
sudo apt install -y openjdk-11-jdk

# Download latest OWASP ZAP release
ZAP_VERSION=$(curl -s https://api.github.com/repos/zaproxy/zaproxy/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/zaproxy/zaproxy/releases/download/${ZAP_VERSION}/ZAP_${ZAP_VERSION#v}_Linux.tar.gz

# Extract archive
tar -xvzf ZAP_${ZAP_VERSION#v}_Linux.tar.gz

# Move ZAP folder to /opt
sudo mv ZAP_${ZAP_VERSION#v} /opt/owasp-zap

# Create symbolic link for easy access
sudo ln -s /opt/owasp-zap/zap.sh /usr/local/bin/zap

# Cleanup tarball
rm ZAP_${ZAP_VERSION#v}_Linux.tar.gz

echo "✅ OWASP ZAP installed. Run with 'zap'."
