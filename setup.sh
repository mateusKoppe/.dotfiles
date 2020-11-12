#!/bin/bash

PWD=`pwd`
VUNDLE_PATH="${HOME}/.config/nvim/bundle/Vundle.vim"

install_softwares(){
    echo "Updating..."
    sudo pacman Syu
    sudo pacman -S git
}

install_zsh(){
    echo "Installing zsh..."
    sudo pacman -S zsh
    echo "Installing Ohmyzsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

install_neovim(){
    echo "Installing neovim"
    sudo pacman -S neovim
    echo "Installing Vundle.vim..."
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
    nvim +PluginInstall +qall
}

install_tmux(){
    echo "Installing Tmux"
    sudo pacman -S tmux
    echo "Instaling tpm"
    git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
}

install_i3(){
    sudo pacman -S rofi
    sudo pacman -S polybar
    sudo pacman -S feh
    sudo pacman -S i3lock
}

set_some_configs(){
  echo "Defining some configs"
  git config --global core.editor nvim
}

install_softwares
install_zsh
install_neovim
install_tmux
install_i3
set_some_configs
