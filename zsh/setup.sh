#!/bin/bash
source ./utils.sh

echo "Installing ZSH and dependencies..."

if $UBUNTU; then
  sudo apt-get install zsh curl stow -y
fi

if $ARCH; then
  sudo pacman -S zsh stow zoxide exa --noconfirm
fi

stow zsh
chsh -s $(which zsh)

echo "Done"
