#!/bin/bash

# Update system packages
sudo dnf update -y  # Update package metadata

# Add the Grafana repository
sudo tee /etc/yum.repos.d/grafana.repo > /dev/null <<EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
EOF

# Install Grafana
sudo dnf install grafana -y  # Installs Grafana server

# Enable and start Grafana service
sudo systemctl enable grafana-server  # Start Grafana on boot
sudo systemctl start grafana-server   # Start Grafana service now

# Verify Grafana service status
sudo systemctl status grafana-server

echo "✅ Grafana installation completed."
