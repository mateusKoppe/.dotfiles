return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        highlight = {
          enabled = true
        },
        auto_install = true
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts={
      max_lines = 3,
      mode = 'cursor',
    }
  },
}
