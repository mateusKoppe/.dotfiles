return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{"<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find file"},
		{"<leader>fg", "<cmd>Telescope live_grep<cr>", desc="Live grep"},
		{"<leader>bf", "<cmd>Telescope buffers<cr>", desc="Find buffer"},
		{"<leader>gs", "<cmd>Telescope git_status<cr>", desc="Git status"},
		{"<leader>gb", "<cmd>Telescope git_branches<cr>", desc="Git branches"},
	}
}
