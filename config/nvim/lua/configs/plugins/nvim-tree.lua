local M = {}

local function set_keymaps()
  vim.keymap.set('n', '<F5>', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  vim.keymap.set('n', '<F6>', '<Cmd>NvimTreeFindFile<CR>', { desc = 'Show current file in NvimTree' })
end

local function on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
end

function M.setup()
  require('nvim-tree').setup({
    on_attach = on_attach,
    view = {
      width = 40,
    },
  })
  set_keymaps()
  -- vim.cmd([[highlight NvimTreeNormal guibg = none]])
end

return M
