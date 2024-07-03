---@type NvPluginSpec
local spec = {
  {
    "coffebar/transfer.nvim",
    enabled = false,
    opts = {},
    event = "VeryLazy",
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    keys = {
      {
        "tu",
        function()
          local api = require "nvim-tree.api"
          local node = api.tree.get_node_under_cursor()
          if node then
            vim.cmd("TransferUpload " .. node.absolute_path)
          end
        end,
        desc = "Upload file or directory",
        nowait = true,
      },
      {
        "td",
        function()
          local api = require "nvim-tree.api"
          local node = api.tree.get_node_under_cursor()
          if node then
            vim.cmd("TransferDownload " .. node.absolute_path)
          end
        end,
        desc = "Download file or directory",
        nowait = true,
      },
      {
        "tf",
        function()
          local api = require "nvim-tree.api"
          local node = api.tree.get_node_under_cursor()
          if node then
            local context_dir = node.absolute_path
            if node.type ~= "directory" then
              context_dir = context_dir:gsub("/[^/]*$", "")
            end
            vim.cmd("TransferDirDiff " .. context_dir)
            vim.cmd "NvimTreeClose"
          end
        end,
        desc = "Diff with remote",
      },
    },
    -- { "ti", "<cmd>TransferInit<CR>", desc = "Init/Edih Deployment config" },
    -- { "tr", "<cmd>TransferRepeat<CR>", desc = "Repeat transfer command" },
  },
}
return spec
