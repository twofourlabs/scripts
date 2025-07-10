#!/bin/bash

set -e

echo "🔄 Updating packages..."
sudo apt-get update && sudo apt-get upgrade -y

echo "🐳 Installing Docker dependencies..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔐 Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📦 Adding Docker repo..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index (Docker repo)..."
sudo apt-get update

echo "🐳 Installing Docker Engine & Docker Compose plugin..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🚀 Enabling and starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "👤 Adding user '$USER' to docker group..."
sudo usermod -aG docker $USER

echo "✅ Docker version:"
docker --version

echo "✅ Docker Compose version:"
docker compose version

echo "✅ Installation complete. You may need to log out and log back in for group changes to apply."