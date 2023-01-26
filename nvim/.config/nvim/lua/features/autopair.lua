local M = {
  active = true,
  package = {
    "windwp/nvim-autopairs",
  },
  config = function()
    require("nvim-autopairs").setup()
  end
}

return M
