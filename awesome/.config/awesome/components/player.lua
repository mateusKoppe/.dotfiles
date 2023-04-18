local awful = require("awful")
local M = {}

local APPS = "spotify,%any"

local player_cmd = function(cmd)
  return function ()
    local run_cmd = string.format("playerctl %s -p %s", cmd, APPS)
    awful.util.spawn(run_cmd)
  end
end

M.play_toggle = player_cmd("play-pause")
M.next = player_cmd("next")
M.prev = player_cmd("previous")

return M
