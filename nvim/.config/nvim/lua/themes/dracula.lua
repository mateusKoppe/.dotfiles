local M = {
  active = true,
  package = { 'Mofiqul/dracula.nvim' },
  config = function()
    vim.cmd.colorscheme "dracula"
  end
}

return M
