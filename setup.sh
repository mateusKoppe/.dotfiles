#!/bin/bash

PWD=`pwd`
VUNDLE_PATH="${HOME}/.config/nvim/bundle/Vundle.vim"

install_softwares(){
    echo "Updating..."
    sudo apt-get update
    echo "Upgrading system"
    sudo apt-get upgrade
    echo "Installing git"
    sudo apt-get install git
    echo "Installing neovim"
    sudo apt-get install neovim
    echo "Installing zsh"
    sudo apt-get install zsh
    echo "Installing Tmux"
    sudo apt-get install tmux
    echo "Installing curl"
    sudo apt-get install curl
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

install_lazygit(){
  sudo add-apt-repository ppa:lazygit-team/daily
  sudo apt-get update
  sudo apt-get install lazygit
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
