local config = {}
config.pre = function()
  if not vim.fn.has("nvim-0.6") then
    -- for filetype.nvim
    -- If using a Neovim version earlier than 0.6.0
    vim.g.did_load_filetypes = 1
  end
end

config.post = function()
end

local function load(name)
  return require("plugins.enhance.config." .. name)
end

config.telescope_config = load("telescope")
config.nvim_tree_config = load("nvim-tree")

return config
