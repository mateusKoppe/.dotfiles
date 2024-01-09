return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
	},
	opts = {
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					added    = "A",
					modified = "M",
					deleted  = "D",
					renamed  = "R",

					-- Status type
					untracked = "?",
					ignored   = "i",
					unstaged  = "?",
					staged    = "!",
					conflict  = "C",
				}
			},
		},

		window = {
			position = "right",
			width = 36,
		},

		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true,

			filtered_items = {
				visible = false, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
			}
		},
	}
}
