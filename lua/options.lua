local opt = vim.opt

opt.visualbell = true -- Use viusal bell instead of beeping

-- File encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- TODO: Add switching between number and relativenumber depending on mode
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor
opt.wrap = true -- Lines longer than current window width will wrap
opt.termguicolors = true -- enables 24-bit RGB color in TUI
opt.cmdheight = 0 -- number of screen lines to use for the command-line
vim.opt.fcs = 'eob: ' -- Avoid trailing whitespaces, aka remove ~ sign

-- Search rules
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Replace tabs with appropriate number of spaces
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Indentation rules
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true -- Every wrapped line will continue visually indented

-- Folding rules
opt.foldmethod = "indent"
opt.foldlevel = 99 -- always start with open folds
opt.foldenable = true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
