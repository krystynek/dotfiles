return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        -- your lazygit configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        { "<Leader>gg", "Snacks.lazygit()", desc = "Lazy[G]it", silent = true },
      },
    },
  },
}
