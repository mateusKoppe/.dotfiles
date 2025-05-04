#!/bin/bash
source ./utils.sh

echo "Installing AwesomeWM and dependencies..."

if $UBUNTU; then
  sudo apt-get install -y awesome picom xclip scrot ranger i3lock brightnessctl blueman
fi

if $ARCH; then
  $PACMAN_INSTALL awesome picom xclip scrot ranger i3lock brightnessctl blueman alsa-utils playerctl
fi

echo "Add user to video group"
echo "  (to control brightness)"
sudo usermod -aG video $USER

stow awesome

echo "Done"
