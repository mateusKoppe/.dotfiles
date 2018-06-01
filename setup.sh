#!/bin/bash

PWD=`pwd`
VUNDLE_PATH="${HOME}/.vim/bundle/Vundle.vim"

install_softwares(){
    echo "Adding PPA..."
    sudo add-apt-repository ppa:jonathonf/vim
    echo "Updating..."
    sudo apt-get update
    echo "Upgrading system"
    sudo apt-get upgrade
    echo "Installing git"
    sudo apt-get install git
    echo "Installing vim"
    sudo apt-get install vim
    echo "Installing zsh"
    sudo apt-get install zsh
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
    vim +PluginInstall +qall
}

install_ohmyzsh(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_softwares
install_vundle
install_vundle_packages
install_ohmyzsh

