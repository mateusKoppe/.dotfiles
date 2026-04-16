local gh = function(x) return 'https://github.com/' .. x end

-- Configs
vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

-- Theme
vim.pack.add({
  gh("folke/tokyonight.nvim"),
})

vim.cmd('colorscheme tokyonight-moon')

-- New UI opt-in
require('vim._core.ui2').enable({})

-- Which key
vim.pack.add({
  gh("folke/which-key.nvim")
})

local wk = require("which-key")

wk.add({
  { "<leader>Q", "<cmd>qa<cr>",         desc = "quit nvim" },
  { "<leader>q", "<cmd>quit<cr>",       desc = "quit panel" },
  { "<C-s>",     "<cmd>write<cr>",      desc = "write" },
  { "<esc>",     "<cmd>nohlsearch<CR>", desc = "clear highlights" },
  { "<C-h>",     "<C-w>h" },
  { "<C-j>",     "<C-w>j" },
  { "<C-k>",     "<C-w>k" },
  { "<C-l>",     "<C-w>l" },
  {
    "<C-C>",
    '"+y',
    desc = "Copy to clipboard system",
    mode = "v"
  },
})


-- -------------------
-- Code editing
-- -------------------

vim.pack.add({
  gh("windwp/nvim-autopairs")
})
require("nvim-autopairs").setup({})

-- -------------------
-- Git integration
-- -------------------

vim.pack.add({
  gh("lewis6991/gitsigns.nvim"),
  gh("NeogitOrg/neogit"),
  gh("nvim-lua/plenary.nvim"),         -- required
  gh("sindrets/diffview.nvim"),        -- optional - Diff integration
  gh("nvim-telescope/telescope.nvim"), -- dependency
})

wk.add({
  {
    '<leader>go', require("neogit").open, desc = "Open neogit"
  },
  {
    '<leader>gc',
    function()
      require("neogit").open({ "commit" })
    end,
    desc = "Create commit"
  }, {
  '<leader>gf',
  function()
    require("neogit").open({ "diff" })
  end,
  desc = "Open diff tree"
},

})

require('gitsigns').setup({
  on_attach = function()
    local gitsigns = require('gitsigns')
    local wk = require("which-key")

    wk.add({
      {
        "<leader>g",
        group = "git",
        expand = function()
          return {
            { "a",  gitsigns.stage_hunk,                desc = "stage hunk" },
            { "A",  gitsigns.stage_buffer,              desc = "stage bugger" },
            { "r",  gitsigns.reset_hunk,                desc = "reset hunk" },
            { "R",  gitsigns.reset_buffer,              desc = "reset buffer" },
            { "k",  gitsigns.preview_hunk,              desc = "preview hunk" },
            { "K",  gitsigns.preview_hunk_inline,       desc = "preview hunk inline" },
            { "d",  gitsigns.diff,                      desc = "diff file" },
            { "D",  gitsigns.diffthis,                  desc = "diff file" },
            { "b",  gitsigns.blame_line,                desc = "blame line" },
            { "B",  gitsigns.blame,                     desc = "blame file" },
            { "tb", gitsigns.toggle_current_line_blame, desc = "toggle line blame" },
            { "tw", gitsigns.toggle_word_diff,          desc = "toggle word diff" },
          }
        end,
        { "[c", function() gitsigns.nav_hunk("prev") end, desc = "prev hunk" },
        { "]c", function() gitsigns.nav_hunk("next") end, desc = "next hunk" },
      },
    })
  end
})

-- -------------------
-- file explorer
-- -------------------
vim.pack.add({
  {
    src = gh('nvim-neo-tree/neo-tree.nvim'),
    version = vim.version.range('3')
  },
  -- dependencies
  gh("nvim-lua/plenary.nvim"),
  gh("MunifTanjim/nui.nvim"),
  -- optional, but recommended
  gh("nvim-tree/nvim-web-devicons"),
})

require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true
    },
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,

    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
    }
  },
})

require("which-key").add({
  { "<leader>e", "<cmd>Neotree float<cr>", desc = "Toggle Explorer float" }
})

-- -------------------
-- Telescope
-- -------------------

vim.pack.add({
  gh("nvim-telescope/telescope.nvim"),
  gh('nvim-lua/plenary.nvim'),
  -- { gh('nvim-telescope/telescope-fzf-native.nvim'), build = 'make' }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })

-- -------------------
-- LSP
-- -------------------

vim.pack.add({
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("neovim/nvim-lspconfig")
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.opt.completeopt =
"menu,menuone,noselect,popup" -- Ensures the menu appears even for a single match and uses the native popup window.
vim.o.autocomplete = true     -- Enables the overall completion feature.

local wk = require("which-key")
wk.add({
  { 'gl', vim.diagnostic.open_float, desc = "open diagnostic" },
  { '[d', vim.diagnostic.goto_prev,  desc = "diagnostic prev" },
  { ']d', vim.diagnostic.goto_next,  desc = "diagnostic next" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method("textDocument/completion") then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true, -- auto-show menu as you type (recommended)
        -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
      })
    end

    wk.add({
      { "grf", vim.lsp.buf.format,         desc = "LSP Format" },
      { 'grn', desc = "rename" },
      { 'gra', desc = "code Actions" },
      { 'gri', desc = "implementations" },
      { 'grr', desc = "references" },
      { 'grt', desc = "type definition" },
      { 'K',   vim.lsp.buf.hover,          desc = "hover" },
      { 'gd',  vim.lsp.buf.definition,     desc = "go to definition" },
      { 'gD',  vim.lsp.buf.declaration,    desc = "go to declaration" },
      { 'gO',  desc = "document symbols" },
      { 'gs',  vim.lsp.buf.signature_help, desc = "signature help" }
    })
  end,
})

--------------------------
-- Treesitter
-- -----------------------

vim.pack.add({
  gh("nvim-treesitter/nvim-treesitter")
})

vim.api.nvim_create_autocmd('FileType', {
  -- For some reason it wasn't starting automatically for typescriptreact
  pattern = { '<filetype>', 'typescriptreact', 'javascriptreact' },
  callback = function() vim.treesitter.start() end,
})

--------------------------
-- UI
-- -----------------------

vim.pack.add({
  gh('folke/snacks.nvim'),
  gh('nvim-lualine/lualine.nvim'),
  gh('akinsho/bufferline.nvim'),
  gh('nvim-tree/nvim-web-devicons'),
  gh('karb94/neoscroll.nvim'),
})

require('snacks').setup({
  indent = {
    enabled = true,
    indent = {
      only_scope = true,
      only_current = true, -- only show indent guides in the current window
    },
    scope = {
      enabled = false,
    },
    animate = {
      enabled = false
    }
  },

  input = {
    enabled = true,

    win = {
      relative = "cursor",
      border = true,
      row = -2, -- Offset from cursor (optional)
      col = 0,
    },
  },

  picker = {
    enabled = true
  },

  scroll = {
    enabled = true
  }
})

require('lualine').setup({
  options = {
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  }
})
require("bufferline").setup({})
