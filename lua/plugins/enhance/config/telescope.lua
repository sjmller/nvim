return function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    print('telescope not found')
    return
  end
end
