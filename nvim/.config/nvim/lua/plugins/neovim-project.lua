---@type NvPluginSpec
local spec = {
  {
    "coffebar/neovim-project",
    opts = {
      projects = { -- define project roots
        "~/projects/*",
        "~/.config/*",
        "~/code/*",
      },
      dashboard_mode = true,
      last_session_on_startup = false,
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    keys = { -- Example mapping to toggle outline
      {
        "<leader>fp",
        "<cmd>Telescope neovim-project history<CR>",
        desc = "select a project from your recent history.",
      },
      { "<leader>fP", "<cmd>Telescope neovim-project discover<CR>", desc = "find a project based on patterns." },
    },
  },
}
return spec
