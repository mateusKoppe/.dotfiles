#!/bin/bash
source ./utils.sh

echo "Installing Sway and dependencies..."

install stow sway pulseaudio-util pavucontrol brightnessctl grim slurp wl-clipboard swayidle swaylock blueman wlsunset

echo "Add user to video group to control brightness level"
sudo gpasswd -a $USER video

echo "Done"
