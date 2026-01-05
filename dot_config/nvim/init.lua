if vim.g.vscode then
  -- bootstrap lazy.nvim, LazyVim and your plugins
  -- VS Code extension
  require("vscodeneovim")
else
  -- ordinary Neovim
  require("config.lazy")
end
