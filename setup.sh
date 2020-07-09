#!/bin/bash

PWD=`pwd`
VUNDLE_PATH="${HOME}/.config/nvim/bundle/Vundle.vim"

install_softwares(){
    echo "Updating..."
    sudo pacman Syu
    sudo pacman -S git -y
    echo "Installing neovim"
    sudo pacman -S neovim -y
    echo "Installing zsh"
    sudo pacman -S zsh -y
    echo "Installing Tmux"
    sudo pacman -S tmux -y
}

install_vundle(){
    if [ -d $VUNDLE_PATH ];
    then
        update_vundle
    else
        echo "Installing Vundle.vim"
        git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
    fi
}


install_tpm(){
    echo "Instaling tpm"
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
}

update_vundle(){
    echo "Updating Vundle.vim"
    cd "${VUNDLE_PATH}"
    git pull
    cd ${PWD}
}

install_vundle_packages(){
    nvim +PluginInstall +qall
}

install_ohmyzsh(){
  echo "Installing Ohmyzsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

set_some_configs(){
  echo "Defining some configs"
  git config --global core.editor nvim
}

install_softwares
install_vundle
install_vundle_packages
install_ohmyzsh
install_tpm
set_some_configs
