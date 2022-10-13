local nvim = {}

-- The entry point of the whole configuration
nvim.setup = function()

  -- load configuration from lua/editor/<module>
  for _, module_name in ipairs({
    "editor.options",
    "editor.keymaps",
    "editor.autocmd",
  }) do
    local ok, err = pcall(require, module_name)
    if not ok then 
      print('Module: ' .. module_name .. ' not found!')
      return
    end
  end
end

return nvim
