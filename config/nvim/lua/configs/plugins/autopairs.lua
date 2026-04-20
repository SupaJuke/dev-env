local M = {}
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

function M.setup()
  npairs.setup()

  -- Latex stuffs
  npairs.add_rules({
    Rule("$", "$", { "tex", "latex" })
        :with_pair(cond.not_before_text("\\"))
        :with_pair(function(opts)
          return opts.next_char ~= "$"
        end)
        :with_move(function(opts)
          return opts.next_char == "$"
        end),

    Rule("\\(", "\\)", { "tex", "latex" }),
    Rule("\\[", "\\]", { "tex", "latex" })
  })
end

return M
