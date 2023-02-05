local wk = require("which-key")

vim.g.mapleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<C-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<C-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>l<CR>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "<leader>w", ":w<CR>")
--vim.keymap.set("n", "<leader>q", ":q<CR>")
--vim.keymap.set("n", "<leader>c", ":q<CR>")


-- Buffer Navigation
vim.keymap.set("n", "H", ":bp<CR>")
vim.keymap.set("n", "L", ":bn<CR>")


wk.register({
  ["<leader>"] = {
    w = { ":w<CR>", "Save" },
    q = { ":q<CR>", "Quit" },
    x = { ":bdel<CR>", "Close Buffer" },
    y = { "\"+y", "Copy to clipboard", mode="v" },
    r = { ":%s/", "Search and Replace", mode="n" },
  },
})
