#!/bin/bash

# Define the destination path dynamically using the current user's home directory
destinationDir="$HOME/.local/share/Enhancer"

# Delete the destination directory if it exists
if [ -d "$destinationDir" ]; then
    rm -rf "$destinationDir"
fi

# Remove the directory from the user's PATH in .bashrc and .zshrc
sed -i.bak "/export PATH=.*$destinationDir\"/d" "$HOME/.bashrc"
sed -i.bak "/export PATH=.*$destinationDir\"/d" "$HOME/.zshrc"

# Reload the shell configuration to reflect the changes
if [ -n "$BASH_VERSION" ]; then
    source "$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    source "$HOME/.zshrc"
fi

echo "Enhancer has been successfully uninstalled."
