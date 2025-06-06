#!/bin/bash

# Update system packages
sudo dnf update -y  # Keep system updated

# Install Java (SonarQube requires Java 11 or above)
sudo dnf install java-17-amazon-corretto -y  # Install Java 17

# Download SonarQube latest LTS version
SONAR_VERSION="10.3.0.61019"  # Change to latest if needed
curl -LO https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONAR_VERSION}.zip

# Install unzip if not present
sudo dnf install unzip -y

# Unzip SonarQube
unzip sonarqube-${SONAR_VERSION}.zip

# Move SonarQube folder to /opt
sudo mv sonarqube-${SONAR_VERSION} /opt/sonarqube

# Create sonar user without login shell
sudo useradd -r -s /bin/false sonar

# Change ownership
sudo chown -R sonar:sonar /opt/sonarqube

# Clean up zip
rm sonarqube-${SONAR_VERSION}.zip

echo "✅ SonarQube installation completed. Configure and start manually."
