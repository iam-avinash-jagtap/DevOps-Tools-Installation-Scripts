#!/bin/bash

# Update packages
sudo apt update -y

# Install Java (SonarQube requires Java 11+)
sudo apt install -y openjdk-17-jdk unzip wget

# Download SonarQube LTS release
SONAR_VERSION="10.3.0.61019"
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONAR_VERSION}.zip

# Unzip
unzip sonarqube-${SONAR_VERSION}.zip

# Move to /opt
sudo mv sonarqube-${SONAR_VERSION} /opt/sonarqube

# Create sonar user
sudo useradd -r -s /bin/false sonar

# Change ownership
sudo chown -R sonar:sonar /opt/sonarqube

# Cleanup zip file
rm sonarqube-${SONAR_VERSION}.zip

echo "✅ SonarQube installed. Manual config/start required."
