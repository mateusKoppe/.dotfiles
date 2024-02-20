#!/bin/bash
#

echo "Installing AwesomeWM and dependencies..."

if [[ ! -z $(which apt-get) ]]; then
  sudo apt-get install -y awesome picom xclip scrot ranger
elif [[ ! -z $(which pacman) ]]; then
  sudo pacman -S --noconfirm awesome picom xclip scrot ranger
else
  echo "Package manager not found"
fi

stow awesome

echo "Done"
