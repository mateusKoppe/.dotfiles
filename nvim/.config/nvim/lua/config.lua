local M = {}

M.features = {
  require("themes.catppucin"),
  require("features.autopair"),
  require("features.display_indentation"),
  require("features.git"),
  require("features.global_search"),
  require("features.keys_help"),
  require("features.line"),
  require("features.lsp"),
  require("features.startscreen"),
  require("features.syntax"),
  require("features.tabs"),
  require("features.tree"),
  require("features.comment"),
  require("features.ui"),
}

return M
