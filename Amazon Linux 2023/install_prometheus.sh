#!/bin/bash

# Update system packages
sudo dnf update -y  # Ensure system is up to date

# Set Prometheus version
PROMETHEUS_VERSION="2.46.0"  # Change as needed to latest stable version

# Create a Prometheus user without login shell for security
sudo useradd --no-create-home --shell /bin/false prometheus

# Download Prometheus tarball
curl -LO https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Extract tarball
tar xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz

# Move files to appropriate directories
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/

sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/consoles /etc/prometheus
sudo mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/console_libraries /etc/prometheus

# Set ownership
sudo chown -R prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool /etc/prometheus/consoles /etc/prometheus/console_libraries

# Clean up
rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64*
  
echo "✅ Prometheus installation completed."
