local M = {}
local lsp_config = require("lspconfig")
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

  mason_lsp.setup_handlers({
    function(server_name) -- default handler (optional)
      lsp_config[server_name].setup({
        on_attach = lsp_format.on_attach
      })
    end,

    ["clangd"] = function()
      lsp_config.clangd.setup({
        on_attach = lsp_format.on_attach,
      })
    end,

    ["gopls"] = function()
      lsp_config.gopls.setup({
        on_attach = lsp_format.on_attach,
      })
    end,
  })
end

return M
