local M = {}
local ibl = require("ibl")

function M.setup()
  ibl.setup({
    -- (v3) Listing available fields to be configured
    enabled = true,
    indent = {
      -- char = "|",
      char = "│",
      -- tab_char = { "a", "b", "c" },
      -- highlight = { "Function", "Label" },
      -- smart_indent_cap = true,
      -- priority = 2,
    },
    whitespace = { remove_blankline_trail = false },
    scope = {},
  })
end

return M
