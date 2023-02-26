#!/bin/bash

# Install docker
sudo apt-get update
sudo apt-get install -y docker.io git

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create the nimiq user
sudo adduser nimiq --home /home/nimiq --disabled-password

# Add the nimiq user to the docker group
sudo usermod -aG docker nimiq

# Clone the NimiqPool repository
sudo -u nimiq git clone https://github.com/maestroi/NimiqPool.git /home/nimiq/NimiqPool
