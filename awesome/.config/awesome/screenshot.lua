local awful = require("awful")

local screenshot = {}

screenshot.mode = {SELECTION = "a", WINDOW = "w", SCREEN = ""}

function screenshot.take()
    awful.spawn("scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f && rm $f'")
end

return screenshot
