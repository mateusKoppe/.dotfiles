local M = {
  active = true,
  package = {
    "catppuccin/nvim",
    as = "catppuccin"
  },
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}

return M
