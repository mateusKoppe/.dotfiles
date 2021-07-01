require "plugin-list"

require "pk-treesitter"
require "pk-nvim-tree"
require "pk-galaxyline"
require "pk-bufferline"

require "pk-lsp-config"
require "pk-lspinstall"
require "pk-nvim-compe"

require "key-mappings"
require "styles"

vim.o.mouse = "a"
vim.api.nvim_command('set clipboard+=unnamedplus')
