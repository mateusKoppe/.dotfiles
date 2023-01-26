local set = vim.opt
-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

vim.o.timeout = true
vim.o.timeoutlen = 150
vim.wo.number = true

vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true

vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]] -- h/t https://jeffkreeftmeijer.com/vim-number/
