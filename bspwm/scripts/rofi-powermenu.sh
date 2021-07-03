#!/bin/bash

selected=$(echo "Shutdown
Reboot
Exit
Lock
Cancel" | rofi -dmenu -p "Power menu: ")

if [ "$selected" == "Shutdown" ]; then
  shutdown now
fi
if [ "$selected" == "Reboot" ]; then
  reboot
fi
if [ "$selected" == "Exit" ]; then
  bspc quit
fi
if [ "$selected" == "Lock" ]; then
  ~/.dotfiles/bspwm/scripts/lock.sh
fi
if [ "$selected" == "Cancel" ]; then
  exit
fi
