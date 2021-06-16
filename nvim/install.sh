HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"
VUNDLE_PATH="${HOME}/.config/nvim/bundle/Vundle.vim"

rm -fr ${HOME}/.config/nvim
mkdir -p ${HOME}/.config/nvim

echo "Installing neovim"
sudo pacman -Sq --noconfirm neovim
echo "Installing Vundle.vim..."
git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
nvim +PluginInstall +qall

git config --global core.editor nvim

ln -s ${DOTFILES_PATH}/init.vim ${HOME}/.config/nvim/init.vim
