#!/bin/bash
DOTFILES_DIR=$HOME/dotfiles

mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"

if ! grep -q "source ~/dotfiles/bash/.bashrc_custom" "$HOME/.bashrc"; then
    echo "Adding dotfiles to .bashrc..."
    echo "source ~/dotfiles/bash/.bashrc_custom" >> "$HOME/.bashrc"
fi
