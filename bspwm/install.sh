#!/bin/bash
sudo pacman -S --noconfirm bspwm sxhkd picom feh polybar xorg-xbacklight rofi xorg-xsetroot
yay nerd-fonts-fira-code

DIR="$(dirname $(readlink -f $0))"

ln -s ${DIR}/bspwm ~/.config/bspwm
ln -s ${DIR}/sxhkd ~/.config/sxhkd
ln -s ${DIR}/polybar ~/.config/polybar
