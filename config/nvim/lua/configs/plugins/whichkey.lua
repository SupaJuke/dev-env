local M = {}

function M.setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require("which-key").setup({
    win = {
      border = "double",
    },
  })
end

return M
