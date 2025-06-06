#!/bin/bash

# Update system packages
sudo dnf update -y  # Keep system updated

# Add GitLab Runner repository
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash

# Install GitLab Runner
sudo dnf install gitlab-runner -y

# Enable and start GitLab Runner service
sudo systemctl enable gitlab-runner
sudo systemctl start gitlab-runner

# Verify service status
sudo systemctl status gitlab-runner

echo "✅ GitLab Runner installation completed."
