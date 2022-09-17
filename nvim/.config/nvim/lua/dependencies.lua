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

    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    -- Git
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

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

    -- Startscreen
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }

    -- Tabs
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- Tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }

  end
)
