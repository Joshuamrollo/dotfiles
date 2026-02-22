#!/bin/bash

echo -e "Starting Dotfiles Installation..."

DOTFILES_DIR=$HOME/dotfiles

mkdir -p "$HOME/.config/nvim"

echo "Linking Neovim config..."
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

if ! grep -q "source ~/dotfiles/bash/.bashrc_custom" "$HOME/.bashrc"; then
    echo "Adding dotfiles to .bashrc..."
    echo "source ~/dotfiles/bash/.bashrc_custom" >> "$HOME/.bashrc"
fi

echo -e "${GREEN}✅ Installation Complete!${NC}"
