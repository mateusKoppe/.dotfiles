#!/bin/bash
source ./utils.sh

echo "Installing AwesomeWM and dependencies..."

install awesome picom xclip ranger i3lock brightnessctl blueman alsa-utils playerctl 

echo "Add user to video group"
echo "  (to control brightness)"
sudo usermod -aG video $USER

stow awesome

echo "Done"
