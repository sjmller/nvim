local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.background = "dark"

-- Replace tabs with appropriate number of spaces
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

opt.autoindent = true -- Copy indent from current line when starting a new line

opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor
opt.autoindent = true
opt.wrap = true -- Lines longer than current window width will wrap

opt.visualbell = true -- Use viusal bell instead of beeping

-- Folding rules
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true

-- Use cache directory for backup and undo history
local backup_dir = vim.fn.stdpath("cache") .. "/backup"
local resp = vim.fn.mkdir(backup_dir, "p") -- create directory
if resp == 1 then
  opt.backupdir = backup_dir
  opt.directory = backup_dir
end

local undo_dir = vim.fn.stdpath("cache") .. "/undo"
resp = vim.fn.mkdir(undo_dir, "p")
local has_persist = vim.fn.has("persistent_undo")
if resp == 1 and has_persist == 1 then
  opt.undofile = true
  opt.undodir = undo_dir
end
