#!/bin/bash

# Update packages
sudo apt update -y && sudo apt install -y software-properties-common wget

# Add Grafana GPG key and repository
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Update repositories and install Grafana
sudo apt update -y && sudo apt install -y grafana

# Enable and start Grafana service
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "✅ Grafana installed and running."
