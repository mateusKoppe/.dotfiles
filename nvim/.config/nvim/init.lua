require "dependencies"
require "shortcuts"
require "basic_config"

local config = require("config")
for _, features in pairs(config.features) do
    if (features.active) then
    features.config()
    end
end
