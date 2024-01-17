return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").register({
			e = { name = "+explorer"},
			b = { name = "+buffers"},
		}, { prefix = "<leader>" })
	end,
}
