DOTFILES_PATH="$(dirname $(readlink -f $0))"

rm -r ~/.config/nvim
ln -s ${DOTFILES_PATH} ~/.config/nvim

echo "Installing Packer..."
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -u ~/.config/nvim/init.lua +PackerInstall

