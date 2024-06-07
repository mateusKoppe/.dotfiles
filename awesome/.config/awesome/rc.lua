-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
--
--
-- TODO: Install a hibernate and suspend method
require("core.displays").setup()

pcall(require, "luarocks.loader")

require("core.theme").setup()

-- Standard awesome library
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Set the terminal for applications that require it
require("menubar").utils.terminal = require("core.config").terminal

require("core.errors").setup()
require("core.layouts").setup()
require("core.screens").setup(screen)
require("core.keybindings").setup()
require("core.mouse").setup()
require("core.clients").setup(client)
require("core.autostart").setup()
