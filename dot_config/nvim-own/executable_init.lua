-- Neovim configuration entry point
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Load lazy.nvim initialization
require("core.lazy_init")

require("core.autocmds")
require("core.keymaps")
require("core.options")
