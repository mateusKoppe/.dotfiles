#!/bin/bash
source ./utils.sh

echo "Installing Neovim and dependencies..."

if $UBUNTU; then
  sudo apt-get -y install neovim fzf ripgrep
fi

if $ARCH; then
  sudo pacman -Sq neovim fzf ripgrep --noconfirm
fi

stow nvim

echo "Done"

