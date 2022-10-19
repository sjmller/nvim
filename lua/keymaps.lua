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

-- nvim-tree
nmap("<space>t", ":NvimTreeToggle<CR>")

-- telescope
nmap("<leader>ff", function()
  require("telescope.builtin").find_files(require("telescope.themes").get_dropdown())
end)

nmap("<leader>fo", ":Telescope oldfiles<CR>")

nmap("<leader>s", function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local builtin = require("telescope.builtin")
  local opts = {
    sorting_strategy = "ascending",
    results_title = false,
    layout_strategy = "center",
    layout_config = {
      width = 50,
      height = 9,
    },
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  }

  pickers
      .new(opts, {
        prompt_title = "Search",
        finder = finders.new_table({
          results = { "live grep", "buffer symbols", "workspace symbols" },
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()

            local response = {
              ["live grep"] = "live_grep",
              ["buffer symbols"] = "lsp_document_symbols",
              ["workspace symbols"] = "lsp_workspace_symbols",
            }

            local func = response[selection[1]]
            if func == nil then
              return
            end

            builtin[func](require("telescope.themes").get_ivy())
          end)
          return true
        end,
      })
      :find()
end)
