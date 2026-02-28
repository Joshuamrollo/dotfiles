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

# install jq
RUN apt-get update && apt-get install -y jq

# Install yq
RUN curl -fsSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

# Install kubectl
RUN curl -fsSL https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl \
    -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# Install helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install k3d
RUN curl -fsSL https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install skaffold
RUN curl -fsSL https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 \
    -o /usr/local/bin/skaffold && chmod +x /usr/local/bin/skaffold
