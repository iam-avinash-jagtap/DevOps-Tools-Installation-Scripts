#!/bin/bash

# Update system packages
sudo dnf update -y  # Update package list

# Enable EPEL repository (Extra Packages for Enterprise Linux) for Ansible
sudo dnf install epel-release -y  # Required to install Ansible

# Install Ansible
sudo dnf install ansible -y  # Installs Ansible automation tool

# Verify installation
ansible --version  # Shows installed Ansible version

echo "✅ Ansible installation completed."
