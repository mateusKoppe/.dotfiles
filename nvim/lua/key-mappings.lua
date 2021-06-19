
vim.api.nvim_set_keymap(
    "n",
    "<C-/>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "n",
    "<C-p>",
    ":Telescope find_files<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "n",
    "<A-f>",
    ":Telescope live_grep<CR>",
    {
        noremap = true,
        silent = true
    }
)
