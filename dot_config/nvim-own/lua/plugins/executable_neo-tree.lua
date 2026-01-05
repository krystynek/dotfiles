-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<Leader>e', ':Neotree<CR>', desc = 'NeoTree', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- hide filtered items on open
        hide_gitignored = true,
        hide_dotfiles = false,
        hide_by_name = {
          '.github',
          '.gitignore',
          'package-lock.json',
          '.changeset',
          '.prettierrc.json',
        },
        never_show = { '.git' },
      },
      window = {
        mappings = {
          ['<Leader>e'] = 'close_window',
        },
      },
    },
  },
}
