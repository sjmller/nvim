local utils = require("editor.utils")
local map = utils.map
local nmap = utils.nmap

vim.g.mapleader = " "

-- move block easily
nmap("<", "<<")
nmap(">", ">>")

-- create tab like window
nmap("<C-T>h", ":tabprevious<CR>")
nmap("<C-T>l", ":tabnext<CR>")
nmap("<C-T>n", ":tabnew<CR>")

-- save quickly
nmap("<space>w", ":w<CR>")

-- move around the window
nmap("<space>k", "<C-w>k")
nmap("<space>j", "<C-w>j")
nmap("<space>l", "<C-w>l")
nmap("<space>h", "<C-w>h")

-- backspace to delete without yank
map("n", "<BS>", [["_X]], { noremap = false })
map("v", "<BS>", [["_d]], { noremap = false })

-- deactivate highliting after search
nmap("<ESC>", ":nohlsearch<CR>")
