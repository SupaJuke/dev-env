local M = {}
local ib = require("indent_blankline")

function M.setup()
  ib.setup({
    require("indent_blankline").setup {
      -- space_char_blankline = " ",
      show_current_context = true,
      -- use_treesitter = true,
      -- use_treesitter_scope = true,
    }
  })
end

return M
