local M = {
  active = true,
  package = {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require("bufferline").setup {
      options = {
        numbers = "ordinal",
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        diagnostics = "nvim_lsp",
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true
      }
    }

    for t=1,9 do
      local f = string.format
      vim.keymap.set("n", f("<A-%d>", t), f("<Cmd>BufferLineGoToBuffer %d<CR>", t))
    end

    -- Buffer Navigation
    vim.keymap.set("n", "H", "<Cmd>bp<CR>")
    vim.keymap.set("n", "L", "<Cmd>bn<CR>")
    vim.keymap.set("n", "<A-H>", "<Cmd>BufferLineMovePrev<CR>")
    vim.keymap.set("n", "<A-L>", "<Cmd>BufferLineMoveNext<CR>")
    vim.keymap.set("n", "<A-p>", "<Cmd>BufferLineTogglePin<CR>")
  end
}

return M
