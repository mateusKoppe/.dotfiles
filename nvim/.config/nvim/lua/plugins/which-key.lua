return {
	"folke/which-key.nvim",
	config = function()
		local wk = require("which-key")
		wk.register({
			e = { name = "+explorer"},
			b = { name = "+buffers"},
		}, { prefix = "<leader>" })

		wk.register({
			["<C-C>"] = {"\"+y", "Copy to clipboard system"}
		}, {
			mode = "v",
		})
	end,
}
