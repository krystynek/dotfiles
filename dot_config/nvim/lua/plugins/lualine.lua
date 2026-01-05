return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections.lualine_z = {
        function()
          return "[L]"
        end,
      }
      -- table.insert(opts.sections.lualine_z, {
      --   function()
      --     return "😄"
      --   end,
      -- })
    end,
  },
}
