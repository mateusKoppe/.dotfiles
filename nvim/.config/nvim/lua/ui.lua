vim.cmd[[colorscheme dracula]]
vim.opt.termguicolors = true

 require('lualine').setup {
	 theme = "dracula-nvim"
 }

require("bufferline").setup {
  options = {
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    diagnostics = "nvim_lsp",
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true
  }
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
