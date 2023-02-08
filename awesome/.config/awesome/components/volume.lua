local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

local M = {}

M.widget = wibox.widget.textbox(" Vol: -- |")
M.command = 'amixer sget Master | grep -Eo "[[0-9]+%]" | grep -Eo "[0-9]+" | sed -n 1p'

M.refresh = function()
  awful.spawn.easy_async_with_shell(M.command, function(out)
    M.widget.text = string.format(' Vol: %d%% |', out)
  end)
end

M.increase = function()
  awful.util.spawn("amixer -q sset Master 5%+")
  M.refresh()
end

M.decrease = function()
  awful.util.spawn("amixer -q sset Master 5%-")
  M.refresh()
end

M.toggle_mute = function()
  awful.util.spawn("amixer sset Master toggle")
  M.refresh()
end

M.refresher = function()
  gears.timer({
    timeout = 3,
    call_now = true,
    autostart = true,
    callback = function()
      M.refresh()
    end
  })
end

M.create = function()
  M.refresher()

  M.widget.on_middle_click = function()
    M.toggle_mute()
  end

  M.widget.on_wheel_down = function()
    M.decrease()
  end

  M.widget.on_wheel_up = function()
    M.increase()
  end

  return M.widget
end

return M
