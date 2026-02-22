FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install deps
RUN apt-get update && apt-get install -y \
    ripgrep fd-find bat tmux unzip curl libfuse2 \
    && rm -rf /var/lib/apt/lists/*

# Install latest Neovim from prebuilt binary
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    && tar -C /opt -xzf nvim-linux-x86_64.tar.gz \
    && ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim \
    && rm nvim-linux-x86_64.tar.gz
