#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"
SYMLINKS=( ".vimrc" )
VUNDLE_PATH="${HOME}/.vim/bundle/Vundle.vim"

create_symlinks(){
  for symlink in ${SYMLINKS[@]}
  do
    echo "Creating symlink for ${HOME}/${symlink}"
    ln -s ${DOTFILES_PATH}/${symlink} ${HOME}/${symlink} 
  done
}

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

install_softwares
create_symlinks
install_vundle
install_vundle_packages

