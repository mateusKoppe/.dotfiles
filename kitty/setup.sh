#!/bin/bash
source ./utils.sh

echo "Installing Kitty and dependencies..."

install kitty

if $UBUNTU; then
  #TODO: Install font
fi

if $ARCH; then
  $PACMAN_INSTALL ttf-jetbrains-mono ttf-nerd-fonts-symbols
fi

stow kitty

echo "Done"
