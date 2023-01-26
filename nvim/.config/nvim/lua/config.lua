local M = {}

M.features = {
  autopair = require("features.autopair"),
  comment = require("features.comment"),
  display_indentation = require("features.display_indentation"),
  git = require("features.git"),
  global_search = require("features.global_search"),
  keys_help = require("features.keys_help"),
  line = require("features.line"),
  lsp = require("features.lsp"),
  startscreen = require("features.startscreen"),
  syntax = require("features.syntax"),
  tabs = require("features.tabs"),
  theme = require("features.theme"),
  tree = require("features.tree"),
}

return M
