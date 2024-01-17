-- TODO: Register keys with which key
return {
    'lewis6991/gitsigns.nvim',
	opts = {
		on_attach = function()
			local gs = package.loaded.gitsigns
			local wk = require("which-key")

			wk.register({
				g = {
					name = "Git",
					s = { gs.stage_hunk, "stage hunk" },
					r = { gs.reset_hunk, "reset hunk" },
					S = { gs.stage_buffer, "stage buffer" },
					U = { gs.reset_buffer, "reset buffer" },
					u = { gs.undo_stage_hunk, "undo stage hunk" },
					R = { gs.reset_buffer, "reset buffer" },
					p = { gs.preview_hunk, "preview hunk" },
					b = { gs.toggle_current_line_blame, "toggle line blame" },
					d = { gs.diffthis, "diff" },
					B = { function() gs.blame_line{full=true} end, "blame line" },
					D = { function() gs.diffthis('~') end, "diff" },
				},
				prefix = "<leader>"
			})

			wk.register({
				[']c'] = {
					function()
						if vim.wo.diff then return ']c' end
						vim.schedule(function() gs.next_hunk() end)
						return '<Ignore>'
					end ,
					"Next git change"
				},
				['[c'] = {
					function()
						if vim.wo.diff then return '[c' end
						vim.schedule(function() gs.prev_hunk() end)
						return '<Ignore>'
					end,
					"Prev git change"
				}

			})


			-- TODO: Check some of these git feature
			-- Actions
			-- map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
			-- map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
			-- map('n', '<leader>td', gs.toggle_deleted)

			-- Text object
			-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end
	},
}

