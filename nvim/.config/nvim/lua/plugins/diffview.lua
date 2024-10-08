---@type NvPluginSpec
local spec = {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      config = true,
    },
  },
  config = function()
    require("gitsigns").setup {
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = false,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "🔥 <author>, <author_time:%R> - <summary>",
      max_file_length = 10000, -- Disable if file is longer than this (in lines)
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage current hunk" })
        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset current hunk" })
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Stage selected hunk" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "Reset selected hunk" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>hb", function()
          gitsigns.blame_line { full = true }
        end, { desc = "Blame current line" })

        map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff against index" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis "~"
        end, { desc = "Diff against previous commit" })
      end,
    }
  end,
}

return spec
