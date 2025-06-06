#!/bin/bash

# Update package lists
sudo apt update -y

# Install Java (Jenkins dependency)
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository and key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again with Jenkins repo
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Verify Jenkins status
sudo systemctl status jenkins

echo "✅ Jenkins installed and started."
