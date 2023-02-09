local wk = require("which-key")

-- Move windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move lines on visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Close terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

wk.register({
  ["<leader>"] = {
    w = { ":w<CR>", "Save" },
    q = { ":q<CR>", "Quit" },
    x = { ":bn<CR>:bd#<CR>", "Close Buffer" },
    y = { "\"+y", "Copy to clipboard", mode = "v" },
    r = { ":%s/", "Search and Replace", mode = "n" },
    t = { ":term<CR>", "Open terminal", mode = "n" }
  },
})
