local colorscheme_settings = {
  theme = require("editor").config.theme,
}

-- This functions finally apply the colorscheme
local function apply()
  vim.cmd("colorscheme " .. colorscheme_settings.theme)
end

colorscheme_settings.nightfox_setup = function()
  require("nightfox").setup({
    options = {
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      }
    }
  })
  apply()
end

-- return the configuration for load condition
return colorscheme_settings
