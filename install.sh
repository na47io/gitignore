#!/bin/sh
set -e

# Find first writable directory in PATH
detect_install_dir() {
    IFS=":"
    for dir in $PATH; do
        if [ -w "$dir" ]; then
            echo "$dir"
            return
        fi
    done
    echo "$HOME/.local/bin"
}

INSTALL_DIR=${INSTALL_DIR:-$(detect_install_dir)}

# Create install directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

echo "Installing gitignore to $INSTALL_DIR..."

# Download the script
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/gitignore/main/gitignore -o "$INSTALL_DIR/gitignore.tmp"

# Make it executable and move to final location
chmod +x "$INSTALL_DIR/gitignore.tmp"
mv "$INSTALL_DIR/gitignore.tmp" "$INSTALL_DIR/gitignore"

echo "Successfully installed gitignore to $INSTALL_DIR/gitignore"
echo "Make sure '$INSTALL_DIR' is in your PATH."
