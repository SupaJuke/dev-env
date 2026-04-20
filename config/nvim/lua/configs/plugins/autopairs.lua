local M = {}
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

function M.setup()
  npairs.setup({})

  -- Disable the built-in `[` rule for TeX-ish filetypes
  for _, rule in ipairs(npairs.get_rules("[")) do
    rule.not_filetypes = { "tex", "plaintex", "latex" }
  end

  -- Re-add a TeX-only `[` rule, but don't pair after a backslash
  npairs.add_rule(
    Rule("[", "]", { "tex", "plaintex", "latex" })
    :with_pair(cond.not_before_regex("\\\\", 1))
  )
end

return M
