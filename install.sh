#!/bin/sh
set -e

INSTALL_DIR="$HOME/.local/bin"

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

echo "Installing gitignore to $INSTALL_DIR..."

# Download the script
curl -fsSL https://raw.githubusercontent.com/na47io/gitignore/main/gitignore -o "$INSTALL_DIR/gitignore"
chmod +x "$INSTALL_DIR/gitignore"

echo "Successfully installed gitignore to $INSTALL_DIR/gitignore"
echo "Make sure '$HOME/.local/bin' is in your PATH."
