#!/bin/bash

PWD=`pwd`

install_softwares(){
    echo "Updating..."
    sudo pacman Syu
    sudo pacman -S git exa bat
}

install_zsh(){
    echo "Installing zsh..."
    sudo pacman -S zsh
    echo "Installing Ohmyzsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_tmux(){
    echo "Installing Tmux"
    sudo pacman -S tmux
    echo "Instaling tpm"
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
}

install_i3(){
    sudo pacman -S i3
    sudo pacman -S rofi
    sudo pacman -S polybar
    sudo pacman -S feh
    sudo pacman -S i3lock
}

install_neovim(){
  echo -n "Do you wish to use neovim with the configurations? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./nvim/install.sh;
  fi
}

set_some_configs(){
  echo "Defining some configs"
}

install_softwares
install_neovim
install_zsh
install_tmux
install_i3
set_some_configs
