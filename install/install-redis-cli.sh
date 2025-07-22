#!/bin/bash

# install-redis-cli.sh: Installs redis-cli on macOS or Linux
set -e

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS. Installing redis-cli using Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
        exit 1
    fi
    brew install redis
    echo "redis-cli installed via Homebrew."
else
    echo "Detected Linux. Installing redis-cli using apt..."
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y redis-tools
        echo "redis-cli installed via apt."
    else
        echo "Unsupported Linux distribution. Please install redis-cli manually."
        exit 1
    fi
fi

echo "You can now use 'redis-cli' from your terminal." 