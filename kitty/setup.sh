#!/bin/bash
source ./utils.sh

echo "Installing Kitty and dependencies..."

if $UBUNTU; then
  sudo apt install stow kitty 
  #ttf-jetbrains-mono ttf-nerd-fonts-symbols
fi

if $ARCH; then
  sudo pacman -Sq stow kitty ttf-jetbrains-mono ttf-nerd-fonts-symbols --noconfirm
fi

stow kitty

echo "Done"
