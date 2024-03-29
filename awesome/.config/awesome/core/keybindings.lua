local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

local menubar = require("menubar")

local config = require("core.config")
local main_menu = require("components.menu")
local volume = require("components.volume")
local player = require("components.player")

local M = {}

-- {{{ Key bindings
M.globalkeys = gears.table.join(
  awful.key({ config.modkey, }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ config.modkey, }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),
  awful.key({ config.modkey, }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),

  awful.key({ config.modkey, }, "j",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by index", group = "client" }
  ),
  awful.key({ config.modkey, }, "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "client" }
  ),
  awful.key({ config.modkey, }, "w", function() main_menu:show() end,
    { description = "show main menu", group = "awesome" }),

  -- Layout manipulation
  awful.key({ config.modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),
  awful.key({ config.modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }),
  awful.key({ config.modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }),
  awful.key({ config.modkey, }, "u", awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }),
  awful.key({ config.modkey, }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "client" }),


  -- Media
  awful.key({}, "XF86AudioPlay", player.play_toggle),
  awful.key({}, "XF86AudioNext", player.next),
  awful.key({}, "XF86AudioPrev", player.prev),
  awful.key({}, "XF86AudioRaiseVolume", volume.increase),
  awful.key({}, "XF86AudioLowerVolume", volume.decrease),
  awful.key({}, "XF86AudioMute", volume.toggle_mute),
  awful.key({}, "XF86MonBrightnessDown", function () awful.util.spawn("brightnessctl set 10%-") end),
  awful.key({}, "XF86MonBrightnessUp", function () awful.util.spawn("brightnessctl set +10%") end),

  -- Standard program
  awful.key({ config.modkey, "Shift" }, "Return", function() awful.spawn(config.terminal) end,
    { description = "open a terminal", group = "launcher" }),

  awful.key({ config.modkey, "Shift" }, "w", function() awful.spawn("firefox") end,
    { description = "open a browser", group = "launcher" }),

  awful.key({ config.modkey, "Shift" }, "r", function() awful.spawn(config.terminal .. " -e ranger") end,
    { description = "open a ranger", group = "launcher" }),

  awful.key({ config.modkey, "Shift" }, "b", function() awful.spawn(config.terminal .. " -e bluetuith") end,
    { description = "open bluetuith", group = "launcher" }),

  awful.key({ config.modkey, "Shift" }, "d", function() awful.spawn("arandr") end,
    { description = "open arand", group = "launcher" }),

  awful.key({ config.modkey }, "Escape",
    function()
      awful.util.spawn_with_shell("$HOME/.dotfiles/bin/screenlock")
    end,
    { description = "lock screen", group = "awesome" }),

  awful.key({ config.modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ config.modkey, "Control" }, "q", awesome.quit,
    { description = "quit awesome", group = "awesome" }),

  awful.key({ config.modkey, }, "l", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ config.modkey, }, "h", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  awful.key({ config.modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ config.modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ config.modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  awful.key({ config.modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),
  awful.key({ config.modkey, }, "space", function() awful.layout.inc(1) end,
    { description = "select next", group = "layout" }),
  awful.key({ config.modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),

  awful.key({ config.modkey, "Control" }, "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", { raise = true }
        )
      end
    end,
    { description = "restore minimized", group = "client" }),

  -- Prompt
  awful.key({ config.modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
    { description = "run prompt", group = "launcher" }),

  awful.key({ config.modkey }, "x",
    function()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    { description = "lua execute prompt", group = "awesome" }),
  -- Menubar
  awful.key({ config.modkey }, "p", function() menubar.show() end,
    { description = "show the menubar", group = "launcher" }),

  awful.key({ "Shift" }, "Print",
    function()
      awful.util.spawn_with_shell("$HOME/.dotfiles/bin/screenshot")
    end,
    { description = "Screenshot region to clipboard", group = "screenshot" })
)

M.clientkeys = gears.table.join(
  awful.key({ config.modkey, }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),
  awful.key({ config.modkey }, "q", function(c) c:kill() end,
    { description = "close", group = "client" }),
  awful.key({ config.modkey, "Control" }, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),
  awful.key({ config.modkey }, "Return", awful.client.setmaster,
    { description = "set as main", group = "client" }),
  awful.key({ config.modkey, }, "o", function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }),
  awful.key({ config.modkey, }, "t", function(c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }),
  awful.key({ config.modkey, }, "n",
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    { description = "minimize", group = "client" }),
  awful.key({ config.modkey, }, "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" }),
  awful.key({ config.modkey, "Control" }, "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }),
  awful.key({ config.modkey, "Shift" }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
for i = 1, #config.tags do
  M.globalkeys = gears.table.join(M.globalkeys,
    -- View tag only.
    awful.key({ config.modkey }, i,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ config.modkey, "Control" }, i,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ config.modkey, "Shift" }, i,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ config.modkey, "Control", "Shift" }, i,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

M.setup = function()
  root.keys(M.globalkeys)
end

return M
