require "dependencies"
require "sets"

local config = require("config")
for _, features in pairs(config.features) do
    if (features.active) then
    features.config()
    end
end

require "shortcuts"
