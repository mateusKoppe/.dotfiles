return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/")
  },
  keys = {
    -- restore the session for the current directory
    {
      "<leader>;l",
      function() require("persistence").load() end,
      desc="restore current session"
    },
    -- restore the last session
    {
      "<leader>;L",
      function() require("persistence").load({ last = true }) end,
      desc="restore last session"
    },
    -- stop Persistence => session won't be saved on exit
    {
      "<leader>;d",
      function() require("persistence").stop() end,
      desc="stop session record"
    },
    {
      "<leader>;q",
      "<cmd>qa!<cr>",
      desc="quit neovim"
    }
  }
}
