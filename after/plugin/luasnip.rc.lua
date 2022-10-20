local status, vscode_loaders = pcall(
  require, "luasnip.loaders.from_vscode")
if not status then return end

vscode_loaders.lazy_load()
