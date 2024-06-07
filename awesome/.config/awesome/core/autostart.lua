local awful = require("awful")

local M = {}

local AUTOSTART_APPS = {
  "picom",
  "blueman-applet",
  "nm-applet"
}

M.setup = function ()
  for app = 1, #AUTOSTART_APPS do
    awful.spawn(AUTOSTART_APPS[app])
  end
end

return M
