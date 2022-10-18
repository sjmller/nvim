local utils = require("editor.utils")
local uv = vim.loop

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

local plugins = {
  repos = {},
}

-- Load plugins with packer
plugins.load = function()
  local modules = {
    "coding",
    "enhance",
    "colorscheme",
    "completion",
  }

  -- load all plugin modules
  for _, mod in ipairs(modules) do
    require("plugins." .. mod)
  end

  -- initilalize plugins with packer
  require("packer").startup(function(use)
    use({
      "wbthomason/packer.nvim",
      event = "VimEnter",
    })

    -- use repositories define within each 
    -- modules repos.lua file
    for _, repo in ipairs(plugins.repos) do
      use(repo)
    end

  end)
end

-- Check if packer is available
local function has_packer()
  return uv.fs_stat(install_path) ~= nil
end

-- Install packer using git clone
local function install_packer()
  utils.infoL("Installing packer to " .. install_path)
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- Initialize packer
local function init_packer()
  vim.cmd("packadd packer.nvim")

  require("packer").init({
    display = {
      open_fn = function()
        return require("packer.util").float({
          border = "single",
        })
      end,
    },
    git = {
      clone_timeout = 60, -- Timeout, in seconds, for git clones
    },
    auto_clean = true,
    compile_on_sync = true,
    profile = {
      enable = true,
    },
    max_jobs = 50,
  })
end

-- First time installation
local function boot()
  install_packer()
  vim.cmd("packadd packer.nvim")
  plugins.load()
  -- notify user to quit neovim when boot process is done
  vim.cmd(
    "au User PackerComplete echom 'Plugins are installed successfully, please use :qa to exit and restart the neovim'"
  )
  require("packer").sync()
end

-- Initialize plugins
plugins.init = function()
  -- check if packer is available, otherwise install
  if not has_packer() then
    boot()
    return
  end

  -- cache everything to speed uptime start process
  require("impatient")

  init_packer()
  plugins.load()
end

-- Register plugins
plugins.register = function(plug)
  vim.list_extend(plugins.repos, plug)
end

local au = vim.api.nvim_create_autocmd
-- Auto compile in case a init definition within a config module
-- was changed.
au({ "BufWritePost" }, {
  pattern = { "config.lua", "init.lua" },
  callback = function()
    local full_path = vim.fn.expand("%:p")
    -- if the init.lua file is not inside our configuration directory
    -- abort the operation
    if not full_path:match(vim.fn.stdpath("config")) then
      return
    end

    local current_file = vim.fn.expand("%:t")

    if current_file == "init.lua" then
      local parent_dir = vim.fn.expand("%:p:h:t")
      if not (parent_dir == "config") then
        return
      end
    end

    vim.cmd("source " .. full_path)

    require("packer").clean()
    require("packer").compile()
    vim.notify("Packer compile done!", "info", { title = "packer" })
  end,
})

return plugins
