#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Create a new user called "nimiq" with home directory "/opt/nimiq"
useradd -m -d /opt/nimiq nimiq

# Update the package repositories and install packages
apt update
apt install -y git docker.io docker-compose ufw fail2ban unattended-upgrades

# Add the "nimiq" user to the "docker" group
usermod -aG docker nimiq

# Enable UFW (Uncomplicated Firewall)
ufw enable

# Allow incoming connections on ports 80, 443, and 22
ufw allow 80
ufw allow 443
ufw allow 22

# Block all other incoming traffic
ufw default deny

# Create the /opt/nimiq directory
mkdir -p /opt/nimiq

# Set the ownership of the /opt/nimiq directory to the nimiq user
chown -R nimiq:nimiq /opt/nimiq

# Clone the NimiqPool repository
sudo -u nimiq git clone https://github.com/maestroi/NimiqPool.git /opt/nimiq

# Create the necessary directories
sudo -u nimiq mkdir /opt/nimiq/database
sudo -u nimiq mkdir /opt/nimiq/worker
sudo -u nimiq mkdir /opt/nimiq/master
sudo -u nimiq mkdir /opt/nimiq/payout

# Allow the "nimiq" user to run Docker commands without a password
echo 'nimiq ALL=(ALL) NOPASSWD: /usr/bin/docker' | tee /etc/sudoers.d/nimiq-docker

# Update the user's shell to Bash
chsh -s /bin/bash nimiq
