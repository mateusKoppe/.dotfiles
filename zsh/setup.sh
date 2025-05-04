#!/bin/bash
source ./utils.sh

echo "Installing ZSH and dependencies..."

install zsh zoxide exa

stow zsh
chsh -s $(which zsh)

echo "Done"
