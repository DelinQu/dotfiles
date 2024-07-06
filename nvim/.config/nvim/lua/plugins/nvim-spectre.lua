---@type NvPluginSpec
local spec = {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
      is_insert_mode = true, -- start open panel on is_insert_mode
  },
  keys = {
    { "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre", mode = "n" },
    {
      "<leader>sw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Search current word",
      mode = "n",
    },
    { "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Search current word", mode = "v" },
    {
      "<leader>s",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Search on current file",
      mode = "n",
    },
  },
}
return spec
