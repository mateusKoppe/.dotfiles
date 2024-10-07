return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>Q", "<cmd>qa<cr>", desc = "quit nvim" },
      { "<leader>e", group = "explorer" },
      { "<leader>q", "<cmd>quit<cr>", desc = "quit panel" },
      { "<leader>w", "<cmd>write<cr>", desc = "write" },
    }, { prefix = "<leader>" })

    wk.add({
      { "<esc>", "<cmd>nohlsearch<CR>", desc = "clear highlights" },
    })

    wk.add({
      {
        "<C-C>",
        '"+y',
        desc = "Copy to clipboard system",
        mode = "v"
      },
    })
  end,
}
