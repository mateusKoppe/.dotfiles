local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local main_menu = require("components.menu")

local M = {}

M.setup = function()
  root.buttons(gears.table.join(
    awful.button({}, 3, function() main_menu:toggle() end)
  ))
end

return M
