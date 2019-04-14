#!/bin/bash

PWD=`pwd`
VUNDLE_PATH="${HOME}/.config/nvim/bundle/Vundle.vim"

install_softwares(){
    echo "Updating..."
    sudo dnf update -y
    echo "Installing git"
    sudo dnf install git
    echo "Installing neovim"
    sudo dnf install -y neovim python{2,3}-neovim
    echo "Installing zsh"
    sudo dnf install zsh
    echo "Installing Tmux"
    sudo dnf install tmux
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
set_some_configs

