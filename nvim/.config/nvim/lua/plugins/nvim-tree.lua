---@type NvPluginSpec
local spec = {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
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
