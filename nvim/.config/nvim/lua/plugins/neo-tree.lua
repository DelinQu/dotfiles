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
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
          },
          window = {
            mappings = {
              ["-"] = "navigate_up",
              ["."] = "set_root",
              -- ["D"] = "fuzzy_sorter_directory",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              -- ['<key>'] = function(state) ... end,
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
            ["h"] = "open_split",
            ["v"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
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
