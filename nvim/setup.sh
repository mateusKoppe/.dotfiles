echo "Installing Neovim..."
sudo pacman -Sq neovim fzf --noconfirm
echo "Installing Packer..."
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

stow nvim

nvim -u ~/.config/nvim/init.lua +PackerInstall

