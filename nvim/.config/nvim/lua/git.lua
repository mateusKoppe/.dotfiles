local wk = require("which-key")
require('gitsigns').setup()

wk.register({
  ["<leader>"] = {
    g = {
      name = "+git",
      r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
      D = { "<cmd>Gitsigns diffthis<cr>", "Show file diff" },
      d = { "<cmd>Gitsigns preview_hunk<cr>", "Show hunk" },
      b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
      B = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle Blame" },
    },
  },
})
