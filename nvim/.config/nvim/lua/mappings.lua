require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--- NOTE: custom mappings
-- map the Caption to ESC
-- map({ "n", "i", "v" }, "<CapsLock>", "<ESC>", { silent = true })

-- LSP
map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP References" })
map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP Definitions" })
-- map("n", "<leader>h", function()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = "Toggle Inlay Hints" })

-- Terminal
map("n", "<leader>tm", "<cmd>Telescope terms<cr>", { desc = "LSP Terminal Buffers" })
vim.keymap.del("n", "<leader>h")
map("n", "<leader>H", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

-- adjust window size
map("n", "<C-=>", [[<cmd>vertical resize +5<cr>]], { desc = "make the window biger vertically" })
map("n", "<C-->", [[<cmd>vertical resize -5<cr>]], { desc = "make the window smaller vertically" })
map(
  "n",
  "+",
  [[<cmd>horizontal resize +2<cr>]],
  { desc = "make the window bigger horizontally by pressing shift and =" }
)
map(
  "n",
  "_",
  [[<cmd>horizontal resize -2<cr>]],
  { desc = "make the window smaller horizontally by pressing shift and -" }
)

-- switch buffer with Shfit + Command + } or {
map({ "i", "n" }, "<S-D-}>", function()
  require("nvchad.tabufline").next()
end, { desc = "Switch to next buffer" })

map({ "i", "n" }, "<S-D-{>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Switch to previous buffer" })

-- URL-Open mappings
map("n", "gx", "<cmd>:URLOpenUnderCursor<cr>", { desc = "Open URL under cursor" })

-- ggVG to select all
map("n", "a", "ggVG", { desc = "Select all" })

-- vv to enter muti-line visual mode
map("n", "vv", "<C-v>", { desc = "Enter visual block mode" })

-- nvimtree -> neo-tree
map("n", "<C-n>", "<cmd>Neotree close<CR>", { desc = "neotree close window" })
map("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "neotree focus window" })
-- map("n", "<CR>", "<cmd>Neotree filesystem reveal left<CR>", { desc = "neotree reveal left" })
map("n", "<CR>", "<cmd>Neotree reveal<CR>", { desc = "neotree reveal left" })

-- right vim-tree
map("n", "<C-m>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>I", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- buffer
map("n", "<leader>X", "<cmd>%bd<CR>", { desc = "delete all the Buffers" })

-- line start and end
map({ "n", "v" }, "H", "^", { desc = "jump to the start for line" })
map({ "n", "v" }, "L", "$", { desc = "jump to the end for line" })
