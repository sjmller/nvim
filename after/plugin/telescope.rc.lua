local ok, telescope = pcall(require, "telescope")
if not ok then return end

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
