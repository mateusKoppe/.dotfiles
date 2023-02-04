#!/bin/bash
sudo pacman -S --noconfirm bspwm sxhkd picom polybar xorg-xbacklight rofi xorg-xsetroot \
brightnessctl nitrogen dunst ttf-firacode-nerd scrot bluez-utils arandr \
autorandr dmenu nm-connection-editor pavucontrol

yay -S --noconfirm networkmanager-dmenu-git betterlockscreen

stow bspwm

