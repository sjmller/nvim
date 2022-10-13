local colorscheme = {
  -- nightfox colorscheme
    {
      "EdenEast/nightfox.nvim",
      cond = function()
        -- must explicit call this module, or packer will compile it to a constant value
        return require("plugins.colorscheme.config").theme == "nightfox"
      end,
      config = function()
        require("plugins.colorscheme.config").nightfox_setup()
      end,
    },
}
return colorscheme
