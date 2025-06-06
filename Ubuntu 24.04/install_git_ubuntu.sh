#!/bin/bash

# Update package lists
sudo apt update -y

# Install Git
sudo apt install -y git

# Verify installation
git --version

echo "✅ Git installed successfully."
