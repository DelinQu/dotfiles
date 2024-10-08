-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

-- NOTE: custom config for nvchad
M.nvdash = {
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
    "                                 ",
  },
  buttons = {
    { txt = "🎄  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "📄  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "🦙  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    -- { txt = "🏷️  Bookmarks", keys = "Spc m a", cmd = "Telescope marks" },
    { txt = "🎨  Themes", keys = "Spc t h", cmd = "Telescope themes" },
    { txt = "🧪  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
    -- { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "🚀 Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashLazy",
      no_gap = true,
    },
    -- { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
  },
}

M.term = {
  winopts = { number = false, relativenumber = false },
  sizes = { sp = 0.4, vsp = 0.4, ["bo sp"] = 0.4, ["bo vsp"] = 0.4 },
  float = {
    relative = "editor",
    row = 0.25,
    col = 0.2,
    width = 0.6,
    height = 0.5,
    border = "rounded",
  },
}

-- LSP
M.lsp = {
  signature = true,
  border = "rounded",
}

-- Dashboard:
-- https://www.asciiart.eu/image-to-ascii
-- https://github.com/goolord/alpha-nvim/discussions/16?sort=top
-- https://github.com/Asthestarsfalll/img2art
-- https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text
local headers = {
  {
    " ⠀⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀ ",
    " ⠀⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⠀⠀⠀⠀⠀⢰⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧ ",
    " ⢀⡟⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸ ",
    " ⣸⠂⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⣿⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸ ",
    " ⣿⠀⠀⠀⠀⠀⢹⡿⣿⣿⣿⣿⡿⣿⡏⠀⣠⣿⣿⣿⣿⣿⣟⡛⠻⠿⠿⠿⢛⣛⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⣿⠀⠀⠀⠀⠀⢸⣿⣶⣦⣶⣶⣿⡿⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠ ",
    " ⢻⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸ ",
    " ⢸⡆⠀⠀⠀⠀⢰⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎ ",
    " ⠈⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠁ ",
    " ⠀⢹⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠃⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⠿⠿⠿⠿⠿⠻⠛⠟⠛⠛⠛⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠆⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⠀⠀.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⢠⣾⣶⣤⣤⠀⡀⡠⢀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠀⠀⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣵⣶⣾⣶⣿⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣏⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⣼⣏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀ ",
    "                                             ",
  },
  {
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣛⣛⣛⣛⣛⣛⣛⢿⠿⠟⡛⠛⣻⣿⣿⣿⣟⣛⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢉⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣧⣬⣛⡿⢿⣿⣿⣿⣷⣶⣭⣛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣯⣝⡻⢿⣿⣿⣿⣷⣝⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣟⣬⣜⢛⣿⣿⣿⡷⡝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⠮⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠛⠋⠉⠉⠉⠉⠛⠯⣿⣿⢿⣿⣿⣿⣿⣿⣷⣧⡰⠟⢾⢻⣞⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠣⢟⡿⡛⣧⡽⡿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠀⠉⠛⢛⣰⣿⢿⣿⣾⣿⣿⣦⣡⣸⠹⠞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⠢⣯⠊⠝⠿⠃⠁⠀⠀⠀⠀⡀⠀⠀⠀⠀⢰⣿⣿⠀⠀⠀⠀⠉⠻⡿⣿⣯⣯⣿⣿⣿⣦⣼⢰⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠘⡢⠈⣗⠢⠀⠀⠀⠀⠀⠀⣠⠃⠀⢠⢁⣿⣿⣿⡞⡀⠀⠀⠀⠀⠈⠛⣿⣿⣿⣿⣿⣿⣿⣮⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣈⠀⠂⠀⠀⠀⠀⠀⣐⡰⣄⠀⠀⣸⣼⣿⣿⣟⡓⠁⠀⡀⠀⠀⠀⠀⠈⠫⣿⣿⣿⣿⣿⣿⣯⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⢁⠤⠌⢻⣴⢀⣿⣿⠿⠉⠁⠋⢷⡀⠁⠀⠀⡀⠀⠀⠀⠐⣿⣿⣿⣿⣿⣿⣷⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⣀⡏⡀⠀⣾⣿⡀⣹⣿⣧⡾⠛⠒⢄⠱⠀⠀⠀⠀⠀⠁⠀⡀⢺⣻⣿⣿⣿⣿⣿⣧⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠟⠳⢷⢾⣿⣿⣿⡾⠿⣿⡇⡄⠀⣸⣧⠆⠀⠀⠀⠃⠀⠀⠃⠀⢿⣽⣻⣻⣿⣿⣿⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢠⣿⣿⣿⣹⣿⣿⣿⣷⣶⣿⣿⣶⣾⣿⣿⠆⠀⠀⠀⠀⢠⢄⢀⠀⠓⢾⣿⣻⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⠀⡀⢀⡀⠈⠘⠀⠀⢨⣥⢭⣗⢟⢿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡁⠀⠀⠸⣿⣿⠘⠋⠩⠟⢿⣿⣿⣿⣿⣿⣿⣟⠏⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠆⣖⣛⢻⢋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡆⠀⠀⠹⣿⣗⣠⣤⣤⣾⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢂⠒⢅⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢡⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⡿⠿⠟⠋⢁⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢰⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⣀⣴⣿⡏⠠⣆⠀⠀⠀⠀⡀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⠀⢀⣀⣤⣴⣶⣆⠀⢀⣴⣿⣿⣿⣿⣁⣰⣿⡄⠂⠀⠀⠀⠀⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢠⣿⣿⣿⣿⣿⡟⢀⠻⣿⣿⣿⣿⢷⢤⣿⣿⣿⣶⡄⠀⠀⠀⠀⠠⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣾⣿⣿⣿⢶⣿⠁⢾⣧⡹⣿⣿⣿⣿⡿⣿⣿⣿⣏⣤⣾⣮⣦⣄⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⡏⣾⡏⠘⣺⡿⢿⠿⡿⣻⣷⣿⣿⣿⣿⣿⣿⣿⣷⡿⣿⣷⣄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣏⠁⣿⣿⡌⠽⣷⡾⢛⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⢿⣿⣦⠽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⣿⣿⡝⠀⢹⣿⣿⣶⣾⣟⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡻⢿⣧⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "                                                                    ",
  },
}

local random_header = function()
  math.randomseed(os.time())
  local i = math.random(#headers)
  return headers[i]
end
M.nvdash.header = random_header()

return M
