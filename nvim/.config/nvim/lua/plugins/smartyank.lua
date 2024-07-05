---@type NvPluginSpec
local spec = {
  {
    "ibhagwan/smartyank.nvim",
    opts = {
      highlight = {
        timeout = 50, -- timeout for clearing the highlight
      },
    },
    event = "VeryLazy",
    keys = {},
  },
}
return spec
