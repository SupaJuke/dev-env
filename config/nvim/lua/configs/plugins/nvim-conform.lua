local M = {}
local conform = require("conform")

function M.setup()
  conform.setup({
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
      sh = { "shellcheck", "shfmt" }
    },
  })
end

return M
