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
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
      }
    }

    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }

    use "numToStr/Comment.nvim"

    -- Git
    use {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- LSP
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    -- use {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   requires = { {'nvim-lua/plenary.nvim'}}
    -- }
   
    -- Search
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Syntax
    use "nvim-treesitter/nvim-treesitter"
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use 'Mofiqul/dracula.nvim'
    use "lukas-reineke/indent-blankline.nvim"

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

    -- Which key
    use { "folke/which-key.nvim" }

  end
)
