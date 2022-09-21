local wk = require("which-key")

require("telescope").setup({})

wk.register({
  ["<leader>"] = {
    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      q = { "<cmd>Telescope live_grep<cr>", "Find by Query" },
      q = { "<cmd>Telescope git_files<cr>", "Git Files" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    },
  },
})
