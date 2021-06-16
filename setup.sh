#!/bin/bash

PWD=`pwd`

install_softwares(){
    echo "Updating..."
    sudo pacman Syu -q --noconfirm
    sudo pacman -Sq git exa bat --noconfirm
}

install_zsh(){
    echo "Installing zsh..."
    sudo pacman -Sq zsh --noconfirm
    echo "Installing Ohmyzsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_i3(){
    sudo pacman -Sq i3 rofi polybar feh i3lock --noconfirm
}

install_neovim(){
  printf "\n\n"
  echo -n "Do you wish to use neovim with the configurations? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./nvim/install.sh;
  fi
}

install_softwares
install_neovim
install_zsh
