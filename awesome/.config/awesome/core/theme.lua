local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local M = {}

M.theme = {}
local palette = require("core.colors").mocha

M.theme.font = "JetBrainsMono NF Regular 9"

M.theme.bg_normal   = palette.base
M.theme.bg_focus    = palette.crust
M.theme.bg_urgent   = palette.red
M.theme.bg_minimize = palette.surface0
M.theme.bg_systray  = palette.base

M.theme.fg_normal   = palette.subtext0
M.theme.fg_focus    = palette.blue
M.theme.fg_urgent   = palette.crust
M.theme.fg_minimize = palette.text

M.theme.useless_gap   = dpi(5)
M.theme.border_width  = dpi(1)
M.theme.border_normal = palette.crust
M.theme.border_focus  = palette.blue
M.theme.border_marked = palette.maroon

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
