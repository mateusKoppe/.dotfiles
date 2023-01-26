local M = {
  active = true,
  package = {
    "folke/which-key.nvim",
  },
  config = function()
    require("which-key").setup({ })
  end
}

return M
