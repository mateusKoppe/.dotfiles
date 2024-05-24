return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.register({
      e = { name = "+explorer" },
      w = { "<cmd>write<cr>", "write" },
      q = { "<cmd>quit<cr>", "quit" },
    }, { prefix = "<leader>" })

    wk.register({
      ["<esc>"] = { "<cmd>nohlsearch<CR>", "clear highlights" },
    })

    wk.register({
      ["<C-C>"] = { "\"+y", "Copy to clipboard system" }
    }, {
      mode = "v",
    })
  end,
}
