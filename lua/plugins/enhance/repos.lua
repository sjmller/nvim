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
  -- list of nerdfont icons
  {
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
  },

}

return repos
