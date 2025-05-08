#!/bin/bash
source ./utils.sh

echo "Installing Kitty and dependencies..."

install kitty

if $UBUNTU; then
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip -o /tmp/JetBrainsMono.zip
  sudo mkdir /usr/share/fonts/JetBrainsMonoNF
  sudo unzip -o /tmp/JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMonoNF
  fc-cache -v
fi

if $ARCH; then
  $PACMAN_INSTALL ttf-jetbrains-mono ttf-nerd-fonts-symbols
fi

stow kitty

echo "Done"
