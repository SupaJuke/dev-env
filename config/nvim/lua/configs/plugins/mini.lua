local M = {}
local snippets = require("mini.snippets")
local latex_patterns = { "latex/**/*.json", "**/latex.json" }

function M.setup()
  -- Autopairing
  -- require("mini.pairs").setup()

  -- Snippets
  -- mini_snippets.gen_loader.from_lang()
  -- snippets.setup({
  --   snippets = {
  --     snippets.gen_loader.from_lang({
  --       lang_patterns = {
  --         tex = latex_patterns,
  --         latex = latex_patterns
  --       }
  --     })
  --   },
  -- })
end

return M
