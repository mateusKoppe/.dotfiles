#!/bin/bash

install_i3(){
    sudo pacman -S i3
    sudo pacman -S rofi
    yay -S polybar
    sudo pacman -S feh
    sudo pacman -S i3lock
    yay -S deadd-notification-center
    sudo pacman -S playerctl
}

install_i3

