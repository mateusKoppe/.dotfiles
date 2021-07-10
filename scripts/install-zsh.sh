#!/bin/bash

echo "Installing zsh..."
sudo pacman -Sq zsh --noconfirm
echo "Installing Ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
