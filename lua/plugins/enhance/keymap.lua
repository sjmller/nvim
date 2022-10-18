local map = require("editor.utils").map
local nmap = require("editor.utils").nmap

--
-- telescope
--
nmap("<leader>f", function()
  require("telescope.builtin").find_files(require("telescope.themes").get_dropdown())
end)
--
-- nvim-tree
--
-- nmap("<leader>t", function()
nmap("<leader>t", function()
  require("nvim-tree.api").tree.toggle()
end)

