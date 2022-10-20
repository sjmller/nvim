local ok, telescope = pcall(require, "telescope")
if not ok then return end

local builtin = require('telescope.builtin')
local map = vim.keymap

telescope.setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      height = 0.9,
      width = 0.8,
      prompt_position = "top",
      flex = {},
      vertical = {},
      horizontal = {},
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    }
  },
})

telescope.load_extension('fzf')

-- keymaps
map.set('n', '<leader>ff', builtin.find_files, {})
map.set('n', '<leader>fg', builtin.live_grep, {})
map.set('n', '<leader>fb', builtin.buffers, {})
map.set('n', '<leader>fh', builtin.help_tags, {})
map.set('n', '<leader>fo', builtin.oldfiles, {})
