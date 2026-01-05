return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
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
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
      -- colorscheme = function()
      --   require("catppuccin").load()
      -- end,
    },
  },
}
