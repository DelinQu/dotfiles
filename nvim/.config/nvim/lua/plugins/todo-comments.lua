---@type NvPluginSpec
local spec = {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    -- TODO = { icon = " ", color = "info" },
    -- HACK = { icon = " ", color = "warning" },
    -- WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    -- PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    -- NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    -- TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    highlight = {
      comments_only = false, -- uses treesitter to match keywords in comments only
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    keys = {
      {
        "<leader>ft",
        "<cmd>TodoTelescope<CR>",
        desc = "Search through all project todos with Telescope",
      },
    },
  },
}
return spec
