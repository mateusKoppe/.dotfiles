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
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        diagnostics = "nvim_lsp",
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true
      }
    }
  end
}

return M
