#!/bin/bash
source ./utils.sh

echo "Installing Neovim and dependencies..."

install neovim fzf ripgrep

stow nvim

echo "Done"

