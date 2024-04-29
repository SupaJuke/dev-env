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
      lua = { "stylua" },
      python = { "black" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
    },
  })
end

return M
