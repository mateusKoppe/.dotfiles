local awful = require("awful")
-- Autostart Applications
awful.spawn.with_shell("autorandr -c")
awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("(killall volumeicon || true) && volumeicon")
