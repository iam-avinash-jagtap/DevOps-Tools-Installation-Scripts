#!/bin/bash

# Update packages
sudo apt update -y

# Install Maven
sudo apt install -y maven

# Verify installation
mvn -version

echo "✅ Maven installed."
