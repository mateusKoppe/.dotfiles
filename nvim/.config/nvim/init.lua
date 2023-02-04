require "dependencies"
require "sets"

local config = require("config")
for _, feature in ipairs(config.features) do
  if (feature.active) then
    feature.config()
  end
end

require "shortcuts"
