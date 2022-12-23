local TelescopeMonorepos = require('telescope_monorepos');

return require("telescope").register_extension {
  --[[ setup = function(ext_config, config) ]]
  --[[   -- access extension config and user config ]]
  --[[ end, ]]
  exports = {
    telescope_monorepos = TelescopeMonorepos.show_monorepos
  },
}
