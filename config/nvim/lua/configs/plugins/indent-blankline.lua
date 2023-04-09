local M = {}
local ib = require("indent_blankline")

function M.setup()
  ib.setup({
    require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
    }
  })
end

return M
