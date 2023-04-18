local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

local M = {}

local CMD_PERCENTAGE = 'cat /sys/class/power_supply/*/capacity'
local CMD_STATUS = 'cat /sys/class/power_supply/*/status'

local STATUS_ENUM = { LOADING = 0, FULL = 1, CHARGING = 2, DISCHARGING = 3 }

local STATUS_MAP = {
  Discharging = STATUS_ENUM.DISCHARGING,
  Full = STATUS_ENUM.FULL,
  Charging = STATUS_ENUM.CHARGING
}

local STATUS_LABEL = {
  [STATUS_ENUM.LOADING] = function (state)
    return string.format(' B: -- |', state.percentage)
  end,

  [STATUS_ENUM.FULL] = function (_)
    return ""
  end,

  [STATUS_ENUM.CHARGING] = function (state)
    return string.format(' B: C%d%% |', state.percentage)
  end,

  [STATUS_ENUM.DISCHARGING] = function (state)
    return string.format(' B: %d%% |', state.percentage)
  end,
}

M.state = { percentage = 0, status = STATUS_ENUM.LOADING }

M.widget = wibox.widget.textbox()

M.refresh = function()
  awful.spawn.easy_async_with_shell(CMD_PERCENTAGE, function(percentage)
    awful.spawn.easy_async_with_shell(CMD_STATUS, function(status)

      M.state.percentage = percentage
      local sanitazed_status = status:gsub("\r?\n", "")
      M.state.status = STATUS_MAP[sanitazed_status]
      M.render()

    end)
  end)
end

M.render = function()
  M.widget.text = STATUS_LABEL[M.state.status](M.state)
end

M.create = function()
  gears.timer({
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
      M.refresh()
    end
  })
  return M.widget
end

return M
