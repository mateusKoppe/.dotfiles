#!/bin/sh
apt-get update
apt-get install git
apt get install vim

mv ~/dotfiles/* ~
mv ~/dotfiles/.* ~

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
