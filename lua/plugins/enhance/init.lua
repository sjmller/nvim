-- key mapping
require("plugins.enhance.keymap")

-- config before plugins
require("plugins.enhance.config").pre()

-- register plugin repos
local repo = require("plugins.enhance.repos")
require("plugins").register(repo)

-- post hook
require("plugins.enhance.config").post()
