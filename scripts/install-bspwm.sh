#!/bin/bash
sudo pacman -S --noconfirm bspwm sxhkd picom polybar xorg-xbacklight rofi xorg-xsetroot brightnessctl nitrogen xorg-xrbd dunst i3lock
yay nerd-fonts-fira-code scrot bluez-utils

nitrogen --set-scaled ~/.config/bspwm/wallpaper.jpg
