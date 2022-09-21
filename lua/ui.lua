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
