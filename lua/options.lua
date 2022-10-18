local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.background = "dark"

opt.showcmd = true
opt.cmdheight = 0
opt.title = true
vim.opt.ignorecase = true

-- Replace tabs with appropriate number of spaces
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Indentation rules
opt.autoindent = true
opt.smartindent = true

opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor
opt.autoindent = true

opt.wrap = true -- Lines longer than current window width will wrap
opt.breakindent = true -- Every wrapped line will continue visually indented

opt.visualbell = true -- Use viusal bell instead of beeping

-- Folding rules
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Avoid trailing whitespaces, aka remove ~ sign
vim.opt.fcs = 'eob: '
