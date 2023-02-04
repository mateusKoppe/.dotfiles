local packer = require("packer")
local use = packer.use

local config = require("config")

return packer.startup(
  function()
    use "wbthomason/packer.nvim"

    for _, feature in ipairs(config.features) do
      if (feature.active) then
        use(feature.package)
      end
    end
  end
)
