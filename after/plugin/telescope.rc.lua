local ok, telescope = pcall(require, "telescope")
if not ok then
  print('telescope not found')
  return
end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    color_devicons = true,
  },
})
