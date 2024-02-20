#!/bin/bash
#

echo "Installing zsh and dependencies..."

if [[ ! -z $(which apt-get) ]]; then
  sudo apt-get install zsh curl stow -y
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
elif [[ ! -z $(which pacman) ]]; then
  sudo pacman -S zsh zoxide curl stow --noconfirm
else
  echo "Package manager not found"
fi


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p $HOME/.zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting

stow zsh

echo "Done"
