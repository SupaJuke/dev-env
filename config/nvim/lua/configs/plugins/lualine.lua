local M = {}
local lualine = require("lualine")

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

function M.setup()
  lualine.setup({
    options = {
      icons_enabled = true,
      -- theme = 'auto',
      theme = 'auto',
      component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch',
        {
          'diff',
          source = diff_source
        },
        'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = {
        'lsp_status',
        'encoding',
        { 'fileformat', symbols = { unix = vim.fn.has("macunix") and "" or "" } },
        'filetype',
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { 'neo-tree', 'lazy' }
  })
end

return M
