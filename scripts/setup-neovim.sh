echo "Installing Neovim..."
sudo pacman -Sq neovim --noconfirm
echo "Installing Packer..."
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -u ~/.config/nvim/init.lua +PackerInstall

