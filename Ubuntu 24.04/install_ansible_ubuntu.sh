#!/bin/bash

# Update packages
sudo apt update -y

# Install Ansible
sudo apt install -y ansible

# Verify installation
ansible --version

echo "✅ Ansible installed."
