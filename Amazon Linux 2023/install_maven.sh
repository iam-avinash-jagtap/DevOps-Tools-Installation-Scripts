#!/bin/bash

# Update system packages
sudo dnf update -y  # Update packages

# Install Maven
sudo dnf install maven -y  # Installs Apache Maven

# Verify installation
mvn -version  # Display Maven version

echo "✅ Maven installation completed."
