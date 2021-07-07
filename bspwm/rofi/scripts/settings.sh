#!/bin/bash

selected=$(echo "Network Connect
Network Settings
Bluetooth
Keyboard Layout
Audio
Refresh Monitors
Background
Cancel" | rofi -dmenu -p "Settings: ")

if [ "$selected" == "Network Connect" ]; then
  networkmanager_dmenu
fi
if [ "$selected" == "Network Settings" ]; then
  nm-connection-editor
fi
if [ "$selected" == "Bluetooth" ]; then
  ~/.config/rofi/scripts/bluetooth.sh
fi
if [ "$selected" == "Keyboard Layout" ]; then
  ~/.config/rofi/scripts/keyboard-language.sh
fi
if [ "$selected" == "Audio" ]; then
  pavucontrol
fi
if [ "$selected" == "Refresh Monitors" ]; then
  ~/.config/bspwm/scripts/handle-monitors.sh
fi
if [ "$selected" == "Background" ]; then
  nitrogen
fi
