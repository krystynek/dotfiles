-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- fix eslint errors on save
autocmd("BufWritePre", {
  pattern = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.vue" },
  command = "silent! EslintFixAll",
  group = augroup("MyAutocmdsJavaScripFormatting", {}),
})

-- autocmd("VimEnter", {
--   callback = function () require("persistence").load() end,
--   group = augroup("MyAutocmdsPersistence", {}),
-- })
