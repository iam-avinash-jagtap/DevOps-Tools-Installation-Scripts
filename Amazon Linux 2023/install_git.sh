#!/bin/bash

# Update system packages
sudo dnf update -y  # Keeps the system up-to-date

# Install Git
sudo dnf install git -y  # Installs the Git version control system

# Verify the installation
git --version  # Prints the installed Git version

echo "✅ Git installation completed."
