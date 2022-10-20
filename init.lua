local status, _ = pcall(require, "impatient")
if not status then
  require("plugins")
  require("options")
  require("keymaps")
else
  require("impatient")
  require("plugins")
  require("options")
  require("keymaps")
end
