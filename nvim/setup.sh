#!/bin/bash
source ./utils.sh

echo "Installing Neovim and dependencies..."

if $UBUNTU; then
  sudo apt-get -y install neovim fzf ripgrep
fi

if $ARCH; then
  $PACMAN_INSTALL neovim fzf ripgrep
fi

stow nvim

echo "Done"

