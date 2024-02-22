local M = {}
local ibl = require("ibl")

function M.setup()
  ibl.setup({
    enabled = true,
    indent = {
      char = "│",
      -- tab_char = "│",
    },
    whitespace = { remove_blankline_trail = false },
    scope = { enabled = false },
  })
end

return M
