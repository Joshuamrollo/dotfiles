#!/bin/bash

# 1. Colors for pretty output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting Dotfiles Installation...${NC}"

# 2. Define the Dotfiles directory
DOTFILES_DIR=$HOME/dotfiles

# 3. Create necessary config folders
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/tmux"

# 4. Create Symlinks (Force overwrite existing)
echo "Linking Neovim and Tmux configs..."
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# 5. Smart Alias Injection for .bashrc
# We check if we already added the line so we don't double-post it
if ! grep -q "source ~/dotfiles/bash/.bashrc_custom" "$HOME/.bashrc"; then
    echo "Adding dotfiles to .bashrc..."
    echo "source ~/dotfiles/bash/.bashrc_custom" >> "$HOME/.bashrc"
fi

# --- Clean Home Directory Structure ---
echo "🧹 Cleaning up container home directory..."

# 1. Create the 'extra' folder
mkdir -p "$HOME/extra"

# 2. Move standard folders if they exist
# In many dev containers, these are created by the 'common-utils' feature
for folder in Documents Music Pictures Public Templates Videos; do
    if [ -d "$HOME/$folder" ]; then
        mv "$HOME/$folder" "$HOME/extra/"
    fi
done

# 3. Create the XDG config folder and file
mkdir -p "$HOME/.config"
cat << EOF > "$HOME/.config/user-dirs.dirs"
XDG_DESKTOP_DIR="\$HOME/Desktop"
XDG_DOWNLOAD_DIR="\$HOME/Downloads"
XDG_TEMPLATES_DIR="\$HOME/extra/Templates"
XDG_PUBLICSHARE_DIR="\$HOME/extra/Public"
XDG_DOCUMENTS_DIR="\$HOME/extra/Documents"
XDG_MUSIC_DIR="\$HOME/extra/Music"
XDG_PICTURES_DIR="\$HOME/extra/Pictures"
XDG_VIDEOS_DIR="\$HOME/extra/Videos"
EOF

echo -e "${GREEN}✅ Installation Complete!${NC}"
