local colorscheme_settings = {
  theme = require("editor").config.theme,
}

-- Apply selected color scheme
local function apply()
  vim.cmd("colorscheme " .. colorscheme_settings.theme)
end

colorscheme_settings.nightfox_setup = function()
  require("nightfox").setup({
    options = {
      transparent = true,
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      }
    }
  })
  apply()
end

return colorscheme_settings
