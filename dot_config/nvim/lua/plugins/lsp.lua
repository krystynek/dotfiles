local python_line_length = 200
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {},
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pyflakes = { enabled = false, maxLineLength = python_line_length },
                pycodestyle = {
                  ignore = { "W391", "W503" },
                  maxLineLength = python_line_length,
                },
              },
            },
          },
        },
        pyright = {
          mason = true,
          autostart = true,
        },
        yamlls = {
          filetypes = { "yaml", "yml" },
          settings = {
            yaml = {
              format = {
                enable = true,
                singleQuote = true,
              },
            },
          },
        },
        jsonls = {
          filetypes = { "json", "jsonc", "json5" },
          settings = {
            json = {
              format = {
                enable = true,
              },
              schemas = require("schemastore").json.schemas(),
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = function()
      local opts = {
        formatters_by_ft = {
          css = { "prettier" },
          graphql = { "prettier" },
          html = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier", "jsonls" },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organise_imports",
          },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          yaml = { "yamlls" },
        },
        formatters = {},
      }
      return opts
    end,
  },
}
