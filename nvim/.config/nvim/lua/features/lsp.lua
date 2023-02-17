local M = {
  active = true,
  package = {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },


      { "folke/trouble.nvim" },
      { "kyazdani42/nvim-web-devicons" },
    },
  },
  config = function()
    local lsp = require('lsp-zero')
    local wk = require("which-key")

    lsp.preset('recommended')

    lsp.set_preferences({
      set_lsp_keymaps = { omit = { '<F2>', '<F4>', '<C-k>' } }
    })

    lsp.setup()

    vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })

    lsp.on_attach(function()
      wk.register({
        ["<leader>"] = {
          c = {
            name = "+Code",
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            f = { "<cmd>lua vim.lsp.buf.format({async = true})<cr>", "Format" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions" },
          },
        },
      })
    end)

    require("trouble").setup {}
    wk.register({
      ["<leader>"] = {
        c = {
          name = "+Code",
          t = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostic" },
          T = { "<cmd>Trouble workspace_diagnostics<cr>", "Worspace Diagnostic" },
        },
      },
    })

  end
}

return M
