local M = {}
local todo = require("todo-comments")
function M.setup()
  todo.setup({
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "ERROR" },
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      WARN = { icon = " ", color = "warning", alt = { "DEBUG" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      -- TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
      keyword = "wide_fg",
      after = "",
      -- TODO: change this so that it's usable with the ligature
      pattern = [[\s\[(KEYWORDS)\]:]]
    },
    search = {
      pattern = [[\[\b(KEYWORDS)\]:]]
    }
  })
end

return M
