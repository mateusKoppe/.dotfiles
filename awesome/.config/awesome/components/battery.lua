local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

local M = {}

M.widget = wibox.widget.textbox(" Bat: -- |")
M.command = 'cat /sys/class/power_supply/*/capacity'

M.refresh = function()
  awful.spawn.easy_async_with_shell(M.command, function(out)
    M.widget.text = string.format(' Bat: %d%% |', out)
  end)
end

M.refresher = function()
  gears.timer({
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
      M.refresh()
    end
  })
end

M.create = function()
  M.refresher()
  return M.widget
end

return M
