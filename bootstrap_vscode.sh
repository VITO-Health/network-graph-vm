#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Variables
VSCODE_REPO="https://packages.microsoft.com/repos/vscode"
GPG_KEY_URL="https://packages.microsoft.com/keys/microsoft.asc"
GPG_KEYRING="/usr/share/keyrings/packages.microsoft.gpg"
SOURCE_LIST="/etc/apt/sources.list.d/vscode.list"

# Update package list
echo "Updating package list..."
sudo apt update

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y software-properties-common apt-transport-https wget

# Import the Microsoft GPG key
echo "Importing Microsoft GPG key..."
wget -qO- "$GPG_KEY_URL" | sudo gpg --dearmor > "$GPG_KEYRING"

# Add the Visual Studio Code repository
echo "Adding Visual Studio Code repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=$GPG_KEYRING] $VSCODE_REPO stable main" | sudo tee "$SOURCE_LIST"

# Update package list again to include VS Code repository
echo "Updating package list with VS Code repository..."
sudo apt update

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo apt install -y code

echo "Microsoft Visual Studio Code has been installed successfully."
