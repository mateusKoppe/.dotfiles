#!/bin/bash
#

echo "Installing AwesomeWM and dependencies..."

if [[ ! -z $(which apt-get) ]]; then
  sudo apt-get install -y awesome picom xclip scrot ranger i3lock brightnessctl blueman
elif [[ ! -z $(which pacman) ]]; then
  sudo pacman -S --noconfirm awesome picom xclip scrot ranger i3lock brightnessctl blueman alsa-utils playerctl
else
  echo "Package manager not found"
fi

echo "Add user to video group"
echo "  (to control brightness)"

sudo usermod -aG video $USER

stow awesome

echo "Done"
