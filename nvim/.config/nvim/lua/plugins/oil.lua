---@type NvPluginSpec
local spec = {
  {
    "stevearc/oil.nvim",
    enabled = false,
    opts = {
      default_file_explorer = false,
    },
    event = "VeryLazy",
    cmd = "Oil",
    keys = {
      {
        "<leader>fl",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
      {
        "<leader>-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open parent directory",
      },
    },
  },
}
return spec
