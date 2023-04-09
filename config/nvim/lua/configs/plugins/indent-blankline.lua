local M = {}
local ib = require("indent_blankline")

function M.setup()
  vim.cmd [[highlight IndentBlanklineIndent guifg=#D3C6AA gui=nocombine]]

  ib.setup({
    require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      char_highlight_list = {
        -- "IndentBlanklineIndent",
      }
    }
  })
end

return M
