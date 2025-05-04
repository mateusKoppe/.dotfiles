#!/bin/bash
source ./utils.sh

echo "Installing ZSH and dependencies..."

if $UBUNTU; then
  sudo apt-get install zsh curl stow -y
fi

if $ARCH; then
  $PACMAN_INSTALL zsh stow zoxide exa
fi

stow zsh
chsh -s $(which zsh)

echo "Done"
