return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
  keys = {
    {
      '<leader>go',
      function()
        require("neogit").open()
      end,
      desc = "Open neogit"
    },
    {
      '<leader>gc',
      function()
        require("neogit").open({ "commit" })
      end,
      desc = "Create commit"
    },{
      '<leader>gf',
      function()
        require("neogit").open({ "diff" })
      end,
      desc = "Open diff tree"
    },
  }
}

