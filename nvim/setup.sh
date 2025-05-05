#!/bin/bash
source ./utils.sh

echo "Installing Neovim and dependencies..."

install fzf ripgrep

if $UBUNTU; then
  ## Ubuntu provies a old version
  if ! [ -x "$(command -v nvim)" ]; then
    curl -s -L https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.tar.gz | sudo tar xvz -C /opt
    ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  fi
fi

if $ARCH; then
  $PACMAN_INSTALL neovim
fi

stow nvim

echo "Done"

