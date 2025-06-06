#!/bin/bash

# Define Docker Compose version
COMPOSE_VERSION="2.24.6"  # You can change this to the latest version if needed

# Download Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/download/v$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  
# Downloads the Docker Compose binary appropriate for your OS and architecture

# Make the binary executable
sudo chmod +x /usr/local/bin/docker-compose  # Grants execute permissions

# Create a symbolic link to make docker-compose available system-wide
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose  # Optional: ensures access from any shell

# Verify Docker Compose installation
docker-compose --version  # Displays Docker Compose version

echo "✅ Docker Compose installation completed."
