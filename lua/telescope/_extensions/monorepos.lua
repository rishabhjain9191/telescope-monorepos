local TelescopeMonorepos = require('monorepos');

return require("telescope").register_extension {
  --[[ setup = function(ext_config, config) ]]
  --[[   -- access extension config and user config ]]
  --[[ end, ]]
  exports = {
    monorepos = TelescopeMonorepos.show_monorepos
  },
}
