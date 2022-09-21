vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-web-devicons').setup()
require("nvim-tree").setup({
	git = {
		ignore = false
	}
})

vim.api.nvim_set_keymap(
    "n",
    "<C-\\>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)
