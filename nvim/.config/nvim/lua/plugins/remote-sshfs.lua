---@type NvPluginSpec
local spec = {
  {
    "nosduco/remote-sshfs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    mounts = {
      base_dir = vim.fn.expand "$HOME" .. "/.sshfs/",
      -- base_dir = vim.fn.expand "$HOME" .. "/.sshfs/", -- base directory for mount points
      unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
    },
    event = "VeryLazy",
    keys = { -- Example mapping to toggle outline
      { "<leader>sf", "<cmd>RemoteSSHFSConnect<CR>", desc = "open the host picker and connect to a remote host" },
      { "<leader>fs", "<cmd>RemoteSSHFSLiveGrep<CR>", desc = "telescope live grep window and open buffers" },
    },
    -- custom remote path: ~/.local/share/nvim/lazy/remote-sshfs.nvim/lua/remote-sshfs/connections.lua 
  },
}
return spec
