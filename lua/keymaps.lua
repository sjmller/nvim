local status, utils = pcall(require, "utils")
if not status then return end

local map = utils.map
local nmap = utils.nmap

-- define leader key
vim.g.mapleader = " "

-- move block easily
nmap("<", "<<")
nmap(">", ">>")

-- save quickly
nmap("<space>w", "<cmd>w<cr>")

-- move around the window
nmap("<space>k", "<C-w>k")
nmap("<space>j", "<C-w>j")
nmap("<space>l", "<C-w>l")
nmap("<space>h", "<C-w>h")

-- backspace to delete without yank
map("n", "<BS>", [["_X]], { noremap = false })
map("v", "<BS>", [["_d]], { noremap = false })

-- deactivate highliting after search
nmap("<ESC>", "<cmd>nohlsearch<cr>")

-- nvim-tree
nmap("<space>t", ":NvimTreeToggle<cr>")

-- telescope
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap("<leader>fo", "<cmd>Telescope oldfiles<cr>")
