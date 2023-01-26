-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")
local config = require("core.config")

-- Standard awesome library
require("awful.autofocus")

require("core.theme").setup()
require("awful.hotkeys_popup.keys")

local menubar = require("menubar")
menubar.utils.terminal = config.terminal -- Set the terminal for applications that require it

require("core.errors").setup()
require("core.layouts").setup()
require("core.screens").setup(screen)
require("core.keybindings").setup()
require("core.mouse").setup(client)
require("core.clients").setup(client)
require("core.autostart").setup()
