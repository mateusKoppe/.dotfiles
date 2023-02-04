local M = {}

M.features = {
  require("features.keys_help"), -- Needs to load whichKey first

  require("features.autopair"),
  require("features.display_indentation"),
  require("features.git"),
  require("features.global_search"),
  require("features.line"),
  require("features.lsp"),
  require("features.startscreen"),
  require("features.syntax"),
  require("features.tabs"),
  require("features.theme"),
  require("features.tree"),
  require("features.comment"),
}

return M
