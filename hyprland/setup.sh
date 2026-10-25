#!/bin/bash
source ./utils.sh

echo "Installing Hyprland and dependencies..."

install stow hyprlauncher hyprpaper hyprpolkitagent dunst xdg-desktop-portal-hyprland \
  waybar grim slurp wl-clipboard swappy network-manager-applet brightnessctl nwg-look

stow hyprland

echo "Done"
