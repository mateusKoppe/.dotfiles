#!/bin/bash
#

echo "Installing zsh and dependencies..."

if [[ ! -z $(which apt-get) ]]; then
  sudo apt-get install zsh curl stow -y
elif [[ ! -z $(which pacman) ]]; then
  sudo pacman -S zsh stow zoxide exa --noconfirm
else
  echo "Package manager not found"
fi

stow zsh
chsh -s $(which zsh)

echo "Done"
