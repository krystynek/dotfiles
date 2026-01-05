local g = vim.g
local cmd = vim.cmd
g.mapleader = " "
vim.g.maplocalleader = " "

-------------------- HELPERS ------------------------------
local scopes = {
  o = vim.o,
  b = vim.bo,
  w = vim.wo,
}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

local function map(mode, key, value, description)
  vim.keymap.set(mode, key, value, description, {
    silent = true,
  }) -- sets noremap automatically
end

--------------------------- LAZY INIT ------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
---------------------------------------------------------------------------
local vscodePlugins = {
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { -- example for lazy-loading and keymap
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}

-------------------- VSCODE ? NVIM SPECIFIC  ------------------------------
require("lazy").setup(vscodePlugins)
-- git
map("n", "ga", ':call VSCodeNotify("git.stage")<CR>') -- git add
map("n", "gb", ':call VSCodeNotify("git.checkout")<CR>') -- git checkout
map("n", "gcb", ':call VSCodeNotify("git.checkout")<CR>')
map("n", "gl", ':call VSCodeNotify("git.pull")<CR>') -- git pull
map("n", "gn", ':call VSCodeNotify("git.branch")<CR>') -- git checkout -b
map("n", "gsf", ':call VSCodeNotify("git.forcePush")<CR>')
map("n", "gsh", ':call VSCodeNotify("git.push")<CR>') -- git push
map("n", "gst", ':call VSCodeNotify("git-graph.view")<CR>') -- git graph
map("n", "gz", ':call VSCodeNotify("git.stash")<CR>') -- git stash
map("n", "gzp", ':call VSCodeNotify("git.stashPop")<CR>') -- git stash pop
map("n", "gza", ':call VSCodeNotify("git.stashApply")<CR>') -- git stash apply
map("n", "gra", ':call VSCodeNotify("git.rebaseAbort")<CR>') -- git rebase --abort
map("n", "gma", ':call VSCodeNotify("git.mergeAbort")<CR>') -- git rebase --abort
--
-- 	Better Navigation
map({ "x", "n" }, ",e", ':call VSCodeNotify("workbench.action.quickOpen")<CR>')
map({ "x", "n" }, "<C-j>", ':call VSCodeNotify("workbench.action.navigateDown")<CR>')
map({ "x", "n" }, "<C-k>", ':call VSCodeNotify("workbench.action.navigateUp")<CR>')
map({ "x", "n" }, "<C-h>", ':call VSCodeNotify("workbench.action.navigateLeft")<CR>')
map({ "x", "n" }, "<C-l>", ':call VSCodeNotify("workbench.action.navigateRight")<CR>')

-- map({'x', 'n'}, '<Leader>b', ':<C-u>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>') -- toggle sidebar
-- map({'x', 'n'}, '<Leader>e', ':<C-u>call VSCodeNotify("workbench.action.quickOpen")<CR>') -- Quick open
map({ "x", "n" }, "<Leader>c", ':<C-u>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>') -- close windowe
map({ "x", "n" }, "<Leader>f", ':<C-u>call VSCodeNotify("actions.find")<CR>') -- Open search
map({ "x", "n" }, "<Leader>h", ':<C-u>call VSCodeNotify("editor.action.startFindReplaceAction")<CR>') -- Open search and replace
map({ "x", "n" }, "<Leader>m", ":delm!<cr>") -- delete all marks
map({ "x", "n" }, "<Leader>n", ':<C-u>call VSCodeNotify("workbench.view.explorer")<CR>') -- show file tree
map({ "x", "n" }, "<Leader>o", ':<C-u>call VSCodeNotify("workbench.action.joinAllGroups")<CR>') -- Join all windows to one pane
map({ "x", "n" }, "<Leader>r", ':<C-u>call VSCodeNotify("workbench.action.openRecent")<CR>') -- Open recent project
map({ "x", "n" }, "<Leader>s", ':<C-u>call VSCodeNotify("workbench.action.splitEditor")<CR>') -- Splits horizontally
map({ "x", "n" }, "<Leader>v", ':<C-u>call VSCodeNotify("workbench.action.splitEditorDown")<CR>') -- Splits vertically
map({ "x", "n" }, "<Leader><CR>", ':<C-u>call VSCodeNotify("workbench.action.toggleEditorWidths")<CR>') -- Toggle window width
map({ "x", "n" }, "gt", ':<C-u>call VSCodeNotify("workbench.action.nextEditor")<CR>') -- Next editor
map({ "x", "n" }, "gT", ':<C-u>call VSCodeNotify("workbench.action.previousEditor")<CR>') -- previous editor
map("n", "?", ':call VSCodeNotify("workbench.action.findInFiles", { "query": expand("<cword>")})<CR>') -- 	" Run find under the cursor in files`
--  Better Editing
map("n", "<Leader>i", '<Cmd>call VSCodeNotify("extension.toggleBool")<CR>') -- 	" Run bool toggle extention
-- lazyvim
map({ "x", "n" }, "<Leader><Leader>", ':call VSCodeNotify("workbench.action.quickOpen")<CR>')
map({ "x", "n" }, "<Leader>/", ':call VSCodeNotify("workbench.action.findInFiles")<CR>')
map({ "x", "n" }, "<Leader>e", ':call VSCodeNotify("workbench.action.")<CR>')

----------------------------------------------------------------------------
------------------------------ OPTIONS -------------------------------------
----------------------------------------------------------------------------

opt("o", "scrolloff", 4) -- Lines of context
opt("o", "sidescrolloff", 8) -- Columns of context
opt("o", "ignorecase", true) -- Ignore case
opt("o", "smartcase", true) -- Don't ignore case with capitals
opt("o", "hlsearch", true) --
opt("o", "incsearch", true) -- incremental search
opt("o", "backup", false)
opt("o", "writebackup", false)
-- opt('b', 'expandtab', true)              -- Number of spaces tabs count for
-- opt('o', 'joinspaces', false)            -- No double spaces with join after a dot
opt("o", "splitbelow", true) -- Disable line wrap
opt("o", "swapfile", false) -- Disable swapfile
opt("o", "history", 1000)
opt("o", "autoread", true)

-- set fileformats=unix,dos,mac
-- opt('w', 'cursorline', true)
-- opt('o', 'pumheight', 10)
-- opt('o', 'fileencoding', 'utf-8')
opt("o", "cmdheight", 2)
opt("o", "mouse", "a")
-- opt('o', 'updatetime', 50)
-- opt('o', 'timeoutlen', 100)
-- opt('o', 'clipboard', 'unnamedplus')
opt("o", "wildmenu", true)
opt("o", "wildmode", "full")
opt("o", "lazyredraw", true)
opt("o", "signcolumn", "yes:1")
opt("o", "synmaxcol", 200) -- syntax file is slow,

----------------------------------------------------------------------------
--------------------------- COMMPON KEYMAPS --------------------------------
----------------------------------------------------------------------------

-- CamelCase Navigation
map({ "n", "o", "x" }, "<leader>w", "<cmd>lua require('spider').motion('w')<CR>", {
  desc = "Spider-w",
})
map({ "n", "o", "x" }, "<leader>e", "<cmd>lua require('spider').motion('e')<CR>", {
  desc = "Spider-e",
})
map({ "n", "o", "x" }, "<leader>b", "<cmd>lua require('spider').motion('b')<CR>", {
  desc = "Spider-b",
})
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", {
  desc = "Spider-ge",
})

local hop = require("hop")
local directions = require("hop.hint").HintDirection
-- map({'v', 'n'}, 'f', function()
--     hop.hint_char1({
--         direction = directions.AFTER_CURSOR,
--         current_line_only = false
--     })
-- end, {
--     remap = true
-- })
-- map({'v', 'n'}, 'F', function()
--     hop.hint_char1({
--         direction = directions.BEFORE_CURSOR,
--         current_line_only = false
--     })
-- end, {
--     remap = true
-- })
map({ "v", "n" }, "s", function()
  hop.hint_char2({
    direction = directions.AFTER_CURSOR,
    current_line_only = false,
  })
end, {
  remap = true,
})
map({ "v", "n" }, "S", function()
  hop.hint_char2({
    direction = directions.BEFORE_CURSOR,
    current_line_only = false,
  })
end, {
  remap = true,
})
map({ "v", "n", "o", "x" }, "<leader>r", function()
  hop.hint_patterns({
    direction = directions.AFTER_CURSOR,
    hint_offmap = 1,
  })
end, {
  remap = true,
})
map({ "v", "n", "o", "x" }, "<leader>R", function()
  hop.hint_patterns({
    direction = directions.BEFORE_CURSOR,
    hint_offmap = -1,
  })
end, {
  remap = true,
})
map({ "v", "n", "o", "x" }, "<leader>w", function()
  hop.hint_words({
    direction = directions.AFTER_CURSOR,
  })
end, {
  remap = true,
})
map({ "v", "n", "o", "x" }, "<leader>W", function()
  hop.hint_words({
    direction = directions.BEFORE_CURSOR,
  })
end, {
  remap = true,
})

map({ "n", "x" }, "<leader>,", ":noh<cr>") -- clean search highlightsvim.api.nvim_call_function(vim.api.nvim_call_function(
map({ "n", "x" }, "<leader>so", ":%so<cr>") -- TEMP for reload of the config

-- Exit to normal
map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
-- fix jumping screen on next
map("n", "*", "*N")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "Y", "y$") -- makes Y behave similar to C, D (copy to end of the line)
map("n", "J", "mzJ`z") -- keeps cursor on same place

-- VISUAL REMAP FOR BLOCKS
map({ "v" }, "im", "aBoV", {})
map({ "v" }, "am", "aBjoV", {})

-- <leader>v|<leader>s act as <cmd-v>|<cmd-s>
-- <leader>p|P paste from yank register (0)
-- <leader>y|Y yank into clipboard/OSCyank
-- map({'n', 'v'}, '<leader>v', '"+p', {})
-- map({'n', 'v'}, '<leader>V', '"+P', {})
-- map({'n', 'v'}, '<leader>s', '"*p', {})
-- map({'n', 'v'}, '<leader>S', '"*P', {})
map({ "n", "v" }, "<leader>p", '"0p', {})
map({ "n", "v" }, "<leader>P", '"0P', {})
map({ "n", "v" }, "<leader>y", "<cmd>let @+=@0<CR>", {})
-- map({'n', 'v'}, '<leader>y', '<cmd>OSCYankReg 0<CR>', {})

-- indent in visual
map({ "x", "v" }, "<", "<gv")
map({ "x", "v" }, ">", ">gv")
-- Move selected lines up/down in visual mode
map("x", "J", ":move '>+1<CR>gv=gv", {})
map("x", "K", ":move '<-2<CR>gv=gv", {})

-- Undo in Breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "?", "?<C-g>u")
map("i", "!", "!<C-g>u")
map("i", ">", "><C-g>u")
map("i", "}", "}<C-g>u")
map("i", "]", "]<C-g>u")
map("i", ")", ")<C-g>u")

-- console.log snip
map("i", "clg", "console.log()", {})

-- w!! to save with sudo
map("c", "w!!", "<esc>:lua require'utils'.sudo_write()<CR>", {
  silent = true,
})

-- Fix common typos
cmd([[
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
