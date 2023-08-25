local awful = require("awful")

local M = {}

local CMD_MONITORS = "xrandr | grep 'connected' | awk '{print $1}'"

M.setup = function()
  awful.spawn.easy_async_with_shell(CMD_MONITORS, function(monitors_response)
    local monitors = {}
    for s in monitors_response:gmatch("[^\n]+") do
      table.insert(monitors, s)
    end

    local cmd = "xrandr "

    for i, monitor in ipairs(monitors) do
      cmd = cmd .. "--output " .. monitor .. " --auto "
      if (i == 1) then
        cmd = cmd .. "--primary "
      else
        cmd = cmd .. "--right-of " .. monitors[i-1]
      end
    end

    awful.spawn(cmd)
  end)
end

return M
