local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

--[[
-- TODO: Improve yank
-- TODO: Improve buffers capabilities
--]]

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.scrolloff = 8

vim.cmd.colorscheme "catppuccin"

require("lazy").setup("plugins")

