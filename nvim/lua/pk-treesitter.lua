local config = require("nvim-treesitter.configs")

config.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
