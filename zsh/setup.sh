#!/bin/bash

echo "Installing zsh..."
sudo pacman -S zsh --noconfirm
echo "Installing Ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

stow zsh
