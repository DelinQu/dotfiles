require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map the Caption to ESC
-- map({ "n", "i", "v" }, "<CapsLock>", "<ESC>", { silent = true })
-- LSP
map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP References" })
-- map("n", "<leader>h", function()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = "Toggle Inlay Hints" })


-- Terminal
map("n", "<leader>tm", "<cmd>Telescope terms<cr>", { desc = "LSP Terminal Buffers" })
vim.keymap.del('n', '<leader>h')
map("n", "<leader>H", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

-- URL-Open mappings
map("n", "gx", "<cmd>:URLOpenUnderCursor<cr>", { desc = "Open URL under cursor" })


-- ggVG to select all
map("n", "a", "ggVG", { desc = "Select all" })


-- nvimtree -> neo-tree
map("n", "<C-n>", "<cmd>Neotree close<CR>", { desc = "neotree close window" })
map("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "neotree focus window" })
-- vim.keymap.del('n', '<CR>')

-- right vim-tree
map("n", "<C-m>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>I", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- buffer
map("n", "<leader>X", "<cmd>%bd<CR>", { desc = "delete all the Buffers" })
