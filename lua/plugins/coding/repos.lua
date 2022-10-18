local config = require("plugins.coding.config")

local repos = {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = config.treesitter_config,
    ft = config.treesitter_ft,
  },
}

return repos
