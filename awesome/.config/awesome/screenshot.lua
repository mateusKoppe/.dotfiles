-- TODO: Use scrot

local awful = require("awful")
local naughty = require("naughty")

local screenshot = {}

screenshot.mode = {SELECTION = "a", WINDOW = "w", SCREEN = ""}

function screenshot.open() awful.util.spawn_with_shell("gnome-screenshot -i") end

function screenshot.take(options)
    params = ""

    if options.clipboard then params = params .. "c" end
    if options.mode then params = params .. options.mode end

    awful.util.spawn_with_shell("gnome-screenshot -" .. params)
end

return screenshot