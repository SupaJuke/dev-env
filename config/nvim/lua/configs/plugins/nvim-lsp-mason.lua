local M = {}
local lsp_config = require("lspconfig")
local lsp_format = require("lsp-format")
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

-- [TODO]: removed after migrated / issue closed
local blink_cmp = require("blink.cmp")

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
        on_attach = lsp_format.on_attach,
        capabilities = blink_cmp.get_lsp_capabilities()
      })
    end,

    ["lua_ls"] = function()
      lsp_config.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            }
          }
        },
        on_attach = lsp_format.on_attach,
        capabilities = blink_cmp.get_lsp_capabilities()
      })
    end,

    ["bashls"] = function()
      lsp_config.bashls.setup({
        filetypes = { "sh", "zsh" },
        on_attach = lsp_format.on_attach,
        capabilities = blink_cmp.get_lsp_capabilities()
      })
    end,
  })
end

return M
