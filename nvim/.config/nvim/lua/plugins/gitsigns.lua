return {
    'lewis6991/gitsigns.nvim',
	opts = {
		on_attach = function()
			local gs = package.loaded.gitsigns
			local wk = require("which-key")

      wk.add({
        {"<leader>g", group="git"},
        {"<leader>ga", gs.stage_hunk, desc="stage hunk" },
        {"<leader>gr", gs.reset_hunk, desc="reset hunk" },
        {"<leader>gA", gs.stage_buffer, desc="stage buffer" },
        {"<leader>gU", gs.reset_buffer, desc="reset buffer" },
        {"<leader>gu", gs.undo_stage_hunk, desc="undo stage hunk" },
        {"<leader>gR", gs.reset_buffer, desc="reset buffer" },
        {"<leader>gp", gs.preview_hunk, desc="preview hunk" },
        {"<leader>gb", gs.toggle_current_line_blame, desc="toggle line blame" },
        {"<leader>gd", gs.diffthis, desc="diff" },
        {"<leader>gB", function() gs.blame_line{full=true} end, desc="blame line" },
        {"<leader>gD", function() gs.diffthis('~') end, desc="diff" },
        {
          "]c", 
					function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end,
					desc="Next git change"
        },
        {
          "]c", 
					function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end,
					desc="Prev git change"
        }
			})
		end
	},
}

