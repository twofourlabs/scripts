#!/bin/bash

# Script to install Nginx on Debian/Ubuntu

set -e

echo "Updating package list..."
sudo apt update

echo "Installing Nginx..."
sudo apt install -y nginx

echo "Enabling and starting Nginx service..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Checking Nginx status..."
sudo systemctl status nginx | grep Active

echo "Nginx installation complete."