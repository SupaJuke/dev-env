local M = {}
local tn = require("tokyonight")

function M.setup()
  tn.setup({
    style = "moon",
    transparent = false,
    styles = {
      -- sidebars = "transparent",
    },
    lualine_bold = false,
  })
end

return M
