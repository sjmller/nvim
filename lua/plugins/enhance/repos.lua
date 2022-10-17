local config = require("plugins.enhance.config")
local repos = {
  -- cache everything!
  {
    "lewis6991/impatient.nvim",
  },
  -- telescope: extensible fuzzy file finder
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = config.telescope_config,
    module = "telescope",
  },
}

return repos
