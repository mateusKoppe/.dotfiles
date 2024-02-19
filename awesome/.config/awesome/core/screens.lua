local awful = require("awful")
local gears = require("gears")
local topbar = require("components.topbar")
local config = require("core.config")

local M = {}

local WALLPAPER_IMAGE = "/home/koppe/Pictures/wallpapers/wallpaper.png"

local function set_wallpaper(s)
  -- Wallpaper
  gears.wallpaper.maximized(WALLPAPER_IMAGE, s, true)
end

M.setup = function (screen)
  screen.connect_signal("property::geometry", set_wallpaper)

  awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag(config.tags, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))

    topbar.setup_topbar(s)
  end)
end

return M
