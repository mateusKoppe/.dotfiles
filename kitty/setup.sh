#!/bin/bash
source ./utils.sh

echo "Installing Kitty and dependencies..."

if $UBUNTU; then
  sudo apt install stow kitty 
  #ttf-jetbrains-mono ttf-nerd-fonts-symbols
fi

if $ARCH; then
  $PACMAN_INSTALL stow kitty ttf-jetbrains-mono ttf-nerd-fonts-symbols
fi

stow kitty

echo "Done"
