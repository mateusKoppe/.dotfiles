local M = {
  active = true,
  package = { "numToStr/Comment.nvim" },
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<leader>/',
        block = '<leader>c/',
      },
     opleader = {
        line = '<leader>/',
        block = '<leader>c/',
      },
     })
  end
}

return M
