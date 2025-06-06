#!/bin/bash

# Create Prometheus systemd service file
sudo tee /etc/systemd/system/prometheus.service > /dev/null <<EOF
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file /etc/prometheus/prometheus.yml \\
  --storage.tsdb.path /var/lib/prometheus/ \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Create Prometheus data directory and set ownership
sudo mkdir -p /var/lib/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

# Reload systemd daemon to recognize new service
sudo systemctl daemon-reload

# Enable Prometheus service to start at boot
sudo systemctl enable prometheus

# Start Prometheus service now
sudo systemctl start prometheus

# Check Prometheus service status
sudo systemctl status prometheus

echo "✅ Prometheus service setup complete and running."
