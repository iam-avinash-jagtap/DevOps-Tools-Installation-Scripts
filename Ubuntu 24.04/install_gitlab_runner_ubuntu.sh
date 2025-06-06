#!/bin/bash

# Update packages
sudo apt update -y

# Add GitLab Runner repository and install
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash

sudo apt install -y gitlab-runner

# Enable and start service
sudo systemctl enable gitlab-runner
sudo systemctl start gitlab-runner

echo "✅ GitLab Runner installed and running."
