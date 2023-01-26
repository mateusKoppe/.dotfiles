local M = {
  active = true,
  package = {
    "numToStr/Comment.nvim",
  },
  config = function()
    require('Comment').setup()
  end
}

return M
