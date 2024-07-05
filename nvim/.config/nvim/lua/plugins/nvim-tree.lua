---@type NvPluginSpec
local spec = {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = {
      view = {
        adaptive_size = false,
        side = "right",
        width = 30,
        preserve_window_proportions = true,
      },
    },
  },
}
return spec
