local M = {}
local kanagawa = require("kanagawa")

function M.setup()
  kanagawa.setup({
    compile = false,  -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,   -- do not set background color
    dimInactive = true,    -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {             -- add/modify theme and palette colors
      -- Wave palette
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {
          ui = {
            -- default doesn't exist
            bg_gutter = "none",
          }
        },
      },
    },

    overrides = function(colors) -- add/modify highlights
      return {}
    end,

    theme = "wave",
    background = {   -- map the value of 'background' option to a theme
      dark = "wave", -- try "dragon" !
      light = "lotus"
    },
  })
end

return M
