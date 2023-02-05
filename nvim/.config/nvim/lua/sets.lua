local set = vim.opt
-- Set the behavior of tab
vim.g.mapleader = " "

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

vim.o.timeout = true
vim.o.timeoutlen = 150
vim.wo.number = true

vim.opt.wrap = true
vim.opt.hlsearch = false

-- vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]] -- h/t https://jeffkreeftmeijer.com/vim-number/