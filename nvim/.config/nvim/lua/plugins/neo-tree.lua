---@type NvPluginSpec
local spec = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- disable=true,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    event = "VeryLazy",
    config = function()
      require("neo-tree").setup {
        commands = {
          copy_path = function(state)
            -- code apapted from: https://github.com/ibhagwan/smartyank.nvim/blob/master/lua/smartyank/init.lua
            local node = state.tree:get_node()
            if not node then
              vim.notify("No node selected", vim.log.levels.ERROR)
              return
            end

            local file_path = node:get_id()
            local filename = node.name
            if not file_path then
              vim.notify("🎃 Cannot retrieve file path", vim.log.levels.ERROR)
              return
            end

            local yank_data = vim.fn.fnamemodify(file_path, ":.")
            -- local yank_data = vim.fn.fnamemodify(file_path, ":~")

            if vim.fn.has "clipboard" == 1 then
              pcall(vim.fn.setreg, "+", yank_data)
            elseif vim.env.SSH_CONNECTION then
              local base64 = require("smartyank.base64").encode(yank_data)
              local osc52str = string.format("\x1b]52;c;%s\x07", base64)
              local bytes = vim.fn.chansend(vim.v.stderr, osc52str)
              local msg = string.format("[smartyank] %d chars copied using OSC52 (%d bytes)", #yank_data, bytes)
              vim.api.nvim_out_write(msg .. "\n")
              -- vim.notify("Copied via OSC52 protocol", vim.log.levels.INFO)
            elseif vim.env.TMUX then
              local tmux_cmd = { "tmux", "set-buffer", yank_data }
              vim.fn.system(tmux_cmd)
              -- vim.notify("Copied to tmux buffer", vim.log.levels.INFO)
            end

            -- vim.notify(("🎃 Copied: %s"):format(yank_data), vim.log.levels.INFO)
            vim.notify(("🎃 copied path of %s"):format(filename), vim.log.levels.INFO)
          end,
        },
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted = "✖", -- this can only be used in the git_status source
              renamed = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },
        filesystem = {
          window = {
            mappings = {
              ["-"] = "navigate_up",
              ["."] = "set_root",
              -- ["D"] = "fuzzy_sorter_directory",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              -- ['<key>'] = function(state) ... end,
              ["Y"] = "copy_path",
            },
          },
        },
        window = {
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            -- Read `# Preview Mode` for more information
            ["l"] = "focus_preview",
            ["S"] = "split_with_window_picker",
            ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["W"] = "close_all_nodes",
            ["E"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["y"] = "copy_to_clipboard",
            ["c"] = {
              "copy",
              -- config = {
              --   show_path = "relative", -- "none", "relative", "absolute"
              -- },
            },
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["g?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["<C-k>"] = "show_file_details",
          },
        },
      }
    end,
  },
}
return spec
