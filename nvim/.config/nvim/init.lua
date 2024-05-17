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
--- Delete on telescope list
--- Delete all
-- TODO: Implement debugger
-- TODO: Implement Formatter
-- TODO: Implement code actions
-- TODO: Better git integration

-- TODO: Implement search by folder
-- TODO: Implement search and replace
--- https://github.com/nvim-pack/nvim-spectre

-- TODO: https://github.com/stevearc/oil.nvim
-- TODO: https://github.com/stevearc/oil.nvim
--]]

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

