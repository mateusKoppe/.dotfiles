#!/bin/bash

selected=$(echo "us
us(int)
Cancel" | rofi -dmenu -p "Keyboard layout: ")

if [ "$selected" == "us" ]; then
  setxkbmap -layout us
fi
if [ "$selected" == "us(int)" ]; then
  setxkbmap -layout us -variant intl
fi
if [ "$selected" == "Cancel" ]; then
  exit
fi
