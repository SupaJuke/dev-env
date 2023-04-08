local M = {}
local material = require("material")

function M.setup()
  vim.g.material_style = "deep ocean"

  material.setup({
    plugins = {
      "dashboard",
      "gitsigns",
      "nvim-tree",
      "nvim-web-devicons",
      "telescope",
    },
    disable = {
      background = true
    },
    lualine_style = "stealth",
  })
end

return M
