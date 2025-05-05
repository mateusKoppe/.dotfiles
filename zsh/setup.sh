#!/bin/bash
source ./utils.sh

echo "Installing ZSH and dependencies..."

install zsh zoxide eza

stow zsh
chsh -s $(which zsh)

echo "Done"
