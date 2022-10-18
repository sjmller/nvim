local config = {}

--
-- treesitter
--
config.treesitter_config = function()
  local ft = require("plugins.coding.config").treesitter_ft

  require("nvim-treesitter.configs").setup({
    -- packer compile is compiled without runtime context, so here we must give it
    -- the full path to the treesitter ft function for evaluating the filetype
    ensure_installed = ft,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    matchup = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["al"] = "@call.outer",
          ["il"] = "@call.inner",
          ["ap"] = "@parameter.outer",
          ["ip"] = "@parameter.inner",
          ["ao"] = "@condition.outer",
          ["io"] = "@condition.inner",
          ["as"] = "@statement.outer",
        },
      },
    },
  })

  vim.api.nvim_command("set foldmethod=expr")
  vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
end

local function treesitter_ft()
  local fts = {}

  for ft, _ in pairs(require("editor").config.treesitter_ft) do
    table.insert(fts, ft)
  end

  return fts
end

config.treesitter_ft = treesitter_ft()


return config
