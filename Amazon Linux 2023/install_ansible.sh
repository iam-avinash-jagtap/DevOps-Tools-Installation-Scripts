#!/bin/bash

# Update system packages
sudo dnf update -y  # Update package list

# Install Python3 and pip
sudo dnf install python3 python3-pip -y  # Install Python3 and pip

# Verify Python installation
python3 --version  # Check Python version
pip3 --version     # Check pip version

# Enable EPEL repository (Extra Packages for Enterprise Linux) for Ansible
sudo dnf install epel-release -y  # Required to install Ansible

# Install Ansible
sudo dnf install ansible -y  # Installs Ansible automation tool

# Verify Ansible installation
ansible --version  # Shows installed Ansible version

echo "✅ Python3 and Ansible installation completed successfully."
