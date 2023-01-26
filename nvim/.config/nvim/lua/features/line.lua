local M = {
  active = true,
  package = {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  },
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true
      }
    }
  end
}

return M
