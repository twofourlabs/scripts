#!/bin/bash
# This script installs Docker on your system (macOS or Linux)

set -e

OS="$(uname -s)"

if [ "$OS" = "Darwin" ]; then
  echo "Installing Docker for macOS..."
  brew install --cask docker
  echo "Docker installation complete. You may need to start Docker Desktop manually."
elif [ "$OS" = "Linux" ]; then
  echo "Installing Docker for Linux..."
  if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get update
    sudo apt-get install -y \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \ 
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Docker installation complete."
  else
    echo "Unsupported Linux distribution. Please install Docker manually."
    exit 1
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi