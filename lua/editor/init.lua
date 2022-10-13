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
      local msg = "calling module: " .. module_name .. " fail: " .. err
      utils.errorL(msg)
    end
  end
  -- since we have packer compiled, we don't need to load this immediately
  vim.defer_fn(function()
    require("plugins").init()
  end, 0)
end

return nvim
