return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").register({
			e = { name = "+explorer"},
		}, { prefix = "<leader>" })
	end,
}
