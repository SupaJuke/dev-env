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
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      markdown = { "prettierd" },
    },
  })
end

return M
