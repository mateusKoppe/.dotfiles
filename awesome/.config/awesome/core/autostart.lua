local awful = require("awful")

local M = {}

M.setup = function()
  -- awful.spawn.with_shell("autorandr -c")
  awful.spawn.with_shell("picom --experimental-backend")
  awful.spawn.with_shell("nm-applet")
  awful.spawn.with_shell("(killall volumeicon || true) && volumeicon")
  awful.spawn.with_shell("xfce4-power-manager")
  awful.spawn.with_shell("nitrogen --restore")
end

return M
