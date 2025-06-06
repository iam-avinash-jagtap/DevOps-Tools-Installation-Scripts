#!/bin/bash

# Update packages
sudo apt update -y && sudo apt install -y wget tar

# Create prometheus user
sudo useradd --no-create-home --shell /bin/false prometheus

# Download latest Prometheus release
PROM_VERSION=$(curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/prometheus/prometheus/releases/download/${PROM_VERSION}/prometheus-${PROM_VERSION#v}.linux-amd64.tar.gz

# Extract
tar xvf prometheus-${PROM_VERSION#v}.linux-amd64.tar.gz

# Move files
sudo mv prometheus-${PROM_VERSION#v}.linux-amd64 /usr/local/bin/prometheus_temp

# Move binaries
sudo mv /usr/local/bin/prometheus_temp/prometheus /usr/local/bin/
sudo mv /usr/local/bin/prometheus_temp/promtool /usr/local/bin/

# Move consoles and console_libraries
sudo mkdir -p /etc/prometheus
sudo mv /usr/local/bin/prometheus_temp/consoles /etc/prometheus/
sudo mv /usr/local/bin/prometheus_temp/console_libraries /etc/prometheus/

# Change ownership
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# Cleanup
rm -rf prometheus-${PROM_VERSION#v}.linux-amd64.tar.gz /usr/local/bin/prometheus_temp

echo "✅ Prometheus installed. Configure and run manually or via systemd."
