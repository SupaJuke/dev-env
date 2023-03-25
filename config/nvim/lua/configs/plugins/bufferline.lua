local M = {}

function M.setup()
  require("bufferline").setup{
    highlights = {
      fill = {
        -- bg = '#1A1C1D' -- gruvbox_material_custom
        bg = '#23292D' -- everforest
      },
    }
  }
end

return M
