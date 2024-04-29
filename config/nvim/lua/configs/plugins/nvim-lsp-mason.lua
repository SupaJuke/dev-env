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
        package_uninstalled = "✗"
      }
    },
  })

  mason_lsp.setup({
    ensure_installed = {
      "pyright",
      "lua_ls",
      "clangd",
      "gopls",
      "rust_analyzer",
      "tsserver"
    }
  })

  lsp_format.setup()

  mason_lsp.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
      lsp_config[server_name].setup({})
      -- on_attach = lsp_format.on_attach
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end

    ["clangd"] = function()
      lsp_config.clangd.setup({
        on_attach = lsp_format.on_attach
      })
    end,

    ["gopls"] = function()
      lsp_config.gopls.setup({
        on_attach = lsp_format.on_attach
      })
    end,
  })
end

return M
