local M = {}
local ib = require("indent_blankline")

function M.setup()
  ib.setup({
    require("indent_blankline").setup {
      space_char_blankline = "·",
      show_current_context = true,
      -- use_treesitter = true,
      -- use_treesitter_scope = true,
      context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
    }
  })
end

return M
