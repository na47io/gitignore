#!/bin/bash

# Determine install directory
INSTALL_DIR="$HOME/.local/bin"
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR directory..."
    mkdir -p "$INSTALL_DIR"
fi

# Download the script
echo "Downloading gitignore script..."
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/gitignore/main/gitignore -o gitignore.tmp

if [ $? -ne 0 ]; then
    echo "Error: Failed to download gitignore script"
    rm -f gitignore.tmp
    exit 1
fi

# Make it executable
chmod +x gitignore.tmp

# Move to install directory
mv gitignore.tmp "$INSTALL_DIR/gitignore"

echo "Successfully installed gitignore to $INSTALL_DIR/gitignore"
echo "You can now use 'gitignore <language>' to generate .gitignore files"

# Add ~/.local/bin to PATH if necessary
if [ "$INSTALL_DIR" = "$HOME/.local/bin" ]; then
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo "Adding ~/.local/bin to PATH in your shell configuration..."
        if [ -f "$HOME/.zshrc" ]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
            echo "Please restart your shell or run: source ~/.zshrc"
        elif [ -f "$HOME/.bashrc" ]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
            echo "Please restart your shell or run: source ~/.bashrc"
        fi
    fi
fi
