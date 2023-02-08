local awful = require("awful")

local M = {}

M.setup = function()
  awful.spawn.with_shell("picom")
  awful.spawn.with_shell("nitrogen --restore")
  awful.spawn.with_shell("autorandr --change --skip-option crtc && nitrogen --restore")
  awful.spawn.with_shell("nm-applet")
  awful.spawn.with_shell("(killall xfce4-clipman || true) && xfce4-clipman")
end

return M
