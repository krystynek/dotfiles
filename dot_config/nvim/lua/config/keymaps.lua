-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Fix common typos
vim.cmd([[
  cnoreabbrev W! w!
  cnoreabbrev W1 w!
  cnoreabbrev w1 w!
  cnoreabbrev Q! q!
  cnoreabbrev Q1 q!
  cnoreabbrev q1 q!
  cnoreabbrev Qa! qa!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wa wa
  cnoreabbrev Wq wq
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev wq1 wq!
  cnoreabbrev Wq1 wq!
  cnoreabbrev wQ1 wq!
  cnoreabbrev WQ1 wq!
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qa qa
  cnoreabbrev Qall qall
]])

local function map(mode, key, value, description)
  vim.keymap.set(mode, key, value, { desc = description or "", silent = true, noremap = true }) -- sets noremap automaticlly
end

-- single deleted chracter is not stored in register
map("n", "x", '"_x')

-- Undo in Breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "!", "!<C-g>u")
map("i", ">", "><C-g>u")
map("i", "}", "}<C-g>u")
map("i", "]", "]<C-g>u")
map("i", ")", ")<C-g>u")

-- Move selected lines up/down in visual mode
map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "K", ":move '<-2<CR>gv=gv")

-- VISUAL REMAP FOR BLOCKS
map({ "v" }, "im", "aBoV")
map({ "v" }, "am", "aBjoV")

-- Exit to normal
map("i", "jk", "<esc>")

-- fix jumping screen on next
map("n", "*", "*N")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Y", "y$") -- makes Y behave similar to C, D (copy to end of the line)
-- map("n", "J", "mzJ`z") -- keeps cursor on same place

-- map({ "n" }, "<leader>br", ":%s///<left><left>", "[Buffer] - [R]eplace in")
-- map({ "v", "x" }, "<leader>br", ":s///<left><left>", "[Buffer] - [R]eplace in")

map({ "n" }, "<Tab>", ":bnext<CR>")
map({ "n" }, "<S-Tab>", ":bprev<CR>")

-- Toggle line wrapping
map("n", "<leader>lw", "<cmd>set wrap!<CR>")
