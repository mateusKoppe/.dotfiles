local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local main_menu = require("components.menu")

local M = {}

M.setup = function(client)
  root.buttons(gears.table.join(
    awful.button({}, 3, function() main_menu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  ))
  -- Enable sloppy focus, so that focus follows mouse.
  client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
  end)

  client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
  client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
  -- }}}
end

return M
