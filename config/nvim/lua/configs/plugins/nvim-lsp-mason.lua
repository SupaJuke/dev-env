local M = {}
local lsp_config = vim.lsp.config
local lsp_format = require("lsp-format")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

function M.setup()
  mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },

    -- Prefer native LSPs (if avail)
    PATH = "append",
  })

  mason_lsp.setup({
    ensure_installed = {
      "pyright",
      "lua_ls",
      "clangd",
      "gopls",
      "rust_analyzer",
      "ts_ls",
      "bashls",
    },
  })

  lsp_format.setup()

  lsp_config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    on_attach = lsp_format.on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        }
      }
    },
  }

  lsp_config['bashls'] = {
    filetypes = { "sh", "zsh" },
    on_attach = lsp_format.on_attach,
  }
end

return M
