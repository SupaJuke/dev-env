local M = {}
local tn = require("tokyonight")

function M.setup()
  tn.setup({
    style = "moon",
    transparent = true,
    styles = {
      sidebars = "transparent",
    }
  })
end

return M
