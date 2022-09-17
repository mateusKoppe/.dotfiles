local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    use "wbthomason/packer.nvim"

    -- Autocomplete
    use {
      'hrsh7th/cmp-nvim-lsp',
      requires = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path', 
        'hrsh7th/cmp-cmdline', 
        'hrsh7th/nvim-cmp'
      }
    }

    -- Git
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- LSP
    use 'neovim/nvim-lspconfig'
   
    -- Search
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Syntax
    use "nvim-treesitter/nvim-treesitter"

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'Mofiqul/dracula.nvim'

    -- Tabs
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- Tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }

  end
)
