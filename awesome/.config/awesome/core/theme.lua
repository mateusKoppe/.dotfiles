---------------------------
-- Default awesome theme --
---------------------------

local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local M = {}

M.theme = {}

M.theme.font = "sans 8"

M.theme.bg_normal   = "#222222"
M.theme.bg_focus    = "#535d6c"
M.theme.bg_urgent   = "#ff0000"
M.theme.bg_minimize = "#444444"
M.theme.bg_systray  = M.theme.bg_normal

M.theme.fg_normal   = "#aaaaaa"
M.theme.fg_focus    = "#ffffff"
M.theme.fg_urgent   = "#ffffff"
M.theme.fg_minimize = "#ffffff"

M.theme.useless_gap   = dpi(0)
M.theme.border_width  = dpi(1)
M.theme.border_normal = "#000000"
M.theme.border_focus  = "#535d6c"
M.theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
M.theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, M.theme.fg_normal
)
M.theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, M.theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
M.theme.menu_submenu_icon = themes_path .. "default/submenu.png"
M.theme.menu_height       = dpi(15)
M.theme.menu_width        = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
M.theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
M.theme.titlebar_close_button_focus  = themes_path .. "default/titlebar/close_focus.png"

M.theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
M.theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

M.theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
M.theme.titlebar_ontop_button_focus_inactive  = themes_path .. "default/titlebar/ontop_focus_inactive.png"
M.theme.titlebar_ontop_button_normal_active   = themes_path .. "default/titlebar/ontop_normal_active.png"
M.theme.titlebar_ontop_button_focus_active    = themes_path .. "default/titlebar/ontop_focus_active.png"

M.theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
M.theme.titlebar_sticky_button_focus_inactive  = themes_path .. "default/titlebar/sticky_focus_inactive.png"
M.theme.titlebar_sticky_button_normal_active   = themes_path .. "default/titlebar/sticky_normal_active.png"
M.theme.titlebar_sticky_button_focus_active    = themes_path .. "default/titlebar/sticky_focus_active.png"

M.theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
M.theme.titlebar_floating_button_focus_inactive  = themes_path .. "default/titlebar/floating_focus_inactive.png"
M.theme.titlebar_floating_button_normal_active   = themes_path .. "default/titlebar/floating_normal_active.png"
M.theme.titlebar_floating_button_focus_active    = themes_path .. "default/titlebar/floating_focus_active.png"

M.theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
M.theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
M.theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
M.theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

--M.theme.wallpaper = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
M.theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
M.theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
M.theme.layout_floating   = themes_path .. "default/layouts/floatingw.png"
M.theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
M.theme.layout_max        = themes_path .. "default/layouts/maxw.png"
M.theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
M.theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
M.theme.layout_tileleft   = themes_path .. "default/layouts/tileleftw.png"
M.theme.layout_tile       = themes_path .. "default/layouts/tilew.png"
M.theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
M.theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
M.theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
M.theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
M.theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
M.theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
M.theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
M.theme.awesome_icon = theme_assets.awesome_icon(
    M.theme.menu_height, M.theme.bg_focus, M.theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
M.theme.icon_theme = nil

M.setup = function()
  beautiful.init(M.theme)
end

return M

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
