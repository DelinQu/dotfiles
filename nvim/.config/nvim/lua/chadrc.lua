-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_dark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  nvdash = {
    load_on_startup = true,
  },
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.4 },
    float = {
      relative = "editor",
      row = 0.25,
      col = 0.2,
      width = 0.6,
      height = 0.5,
      border = "single",
    },
  },
}

return M
