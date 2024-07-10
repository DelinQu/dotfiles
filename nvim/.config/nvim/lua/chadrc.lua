-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

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
    header = {
      "           ▄ ▄                 DL",
      "   DL  ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      " DL ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █ DL  ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },

    buttons = {
      { "🎄  Find File", "Spc f f", "Telescope find_files" },
      { "📄  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "🦙  Find Word", "Spc f w", "Telescope live_grep" },
      { "🏷️  Bookmarks", "Spc m a", "Telescope marks" },
      { "🎨  Themes", "Spc t h", "Telescope themes" },
      { "🧪  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.4 },
    float = {
      relative = "editor",
      row = 0.2,
      col = 0.15,
      width = 0.7,
      height = 0.6,
      border = "single",
    },
  },
}

return M
