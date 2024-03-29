local M = {}

M.terminal = "kitty"
M.browser = "firefox"
M.editor = os.getenv("EDITOR") or "vim"
M.editor_cmd = M.terminal .. " -e " .. M.editor

M.modkey = "Mod4"
M.altkey = "Mod1"

M.titlebar = false

M.tags = { "1", "2", "3", "4", "5", "6" }

return M
