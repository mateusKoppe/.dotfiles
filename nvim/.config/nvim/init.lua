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
-- TODO: Improve buffers capabilities
-- TODO: Implement search by folder
-- TODO: Implement search and replace
--]]
--
--

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.scrolloff = 8


require("lazy").setup("plugins")


vim.cmd.colorscheme "catppuccin"

