return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				component_separators = { left = '|', right = '|' },
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
		},
    },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ 'stevearc/dressing.nvim', opts = {} },
}
