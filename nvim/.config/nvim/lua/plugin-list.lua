local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    use "wbthomason/packer.nvim"
    use "nvim-treesitter/nvim-treesitter"

    -- lsp stuff
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "hrsh7th/nvim-compe"

    use {
      "nvim-telescope/telescope.nvim",
       requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = {{"kyazdani42/nvim-web-devicons"}}
    }

    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- using packer.nvim
    use {
      "akinsho/nvim-bufferline.lua",
      requires = "kyazdani42/nvim-web-devicons"
    }



    use "arcticicestudio/nord-vim"

  end
)
