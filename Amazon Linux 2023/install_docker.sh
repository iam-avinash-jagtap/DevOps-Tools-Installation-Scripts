#!/bin/bash

# Update system packages
sudo dnf update -y  # Updates all installed packages

# Install Docker
sudo dnf install docker -y  # Installs Docker engine

# Start Docker service
sudo systemctl start docker  # Starts the Docker daemon
sudo systemctl enable docker  # Enables Docker to start at boot

# Add ec2-user to the docker group to run Docker without sudo
sudo usermod -aG docker ec2-user  # Grants docker access to ec2-user

# Inform user to log out and back in for group changes to take effect
echo "⚠️  You must log out and log back in for 'ec2-user' to use Docker without sudo."

# Verify Docker installation
docker --version  # Shows Docker version

echo "✅ Docker installation completed."
