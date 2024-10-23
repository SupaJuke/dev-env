local M = {}
local conform = require("conform")

function M.setup()
  conform.setup({
    -- format = {
    --   async = false,
    --   quiet = false,
    --   lsp_fallback = true
    -- },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true
    },
    formatters_by_ft = {
      -- lua = { "stylua" }, fuck this formatter for using tab
      python = { "black" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
    },
  })
end

return M
