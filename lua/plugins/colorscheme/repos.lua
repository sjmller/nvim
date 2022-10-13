local colorscheme = {
    -- nightfox colorscheme
    {
      -- github repo
      "EdenEast/nightfox.nvim",
      -- get configuration from config module
      cond = function()
        return require("plugins.colorscheme.config").theme == "nightfox"
      end,
      -- call setup from within config module
      config = function()
        require("plugins.colorscheme.config").nightfox_setup()
      end,
    },
}

return colorscheme
