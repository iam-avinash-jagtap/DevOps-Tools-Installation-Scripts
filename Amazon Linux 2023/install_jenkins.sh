#!/bin/bash

# Update system packages
sudo dnf update -y  # Ensures system is up-to-date

# Install Java (Jenkins requires Java)
sudo dnf install java-17-amazon-corretto -y  # Installs Java 17 for Jenkins runtime

# Add Jenkins repo and import the GPG key
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo  # Adds Jenkins YUM repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key  # Imports Jenkins repo GPG key

# Install Jenkins
sudo dnf install jenkins -y  # Installs Jenkins package

# Enable and start the Jenkins service
sudo systemctl enable jenkins  # Enables Jenkins to start at boot
sudo systemctl start jenkins  # Starts the Jenkins service

# Check Jenkins status
sudo systemctl status jenkins  # Verifies Jenkins is running

echo "✅ Jenkins installation completed."
echo "🔑 To unlock Jenkins, use the password from: /var/lib/jenkins/secrets/initialAdminPassword"
