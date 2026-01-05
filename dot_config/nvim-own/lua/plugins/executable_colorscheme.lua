return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,
      styles = {
        -- sidebars = "transparent",
        -- floats = "transparent",
      },
      on_color = function(colors) end,
      on_highlights = function(hl, c)
        hl.DiagnosticUnnecessary = {
          fg = "#a33a74",
        }
      end,
    },
    config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
  },
}
