local M = {}

local keymap = vim.keymap.set

function M.setup()
  -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  vim.g.neo_tree_remove_legacy_commands = 1
  keymap('n', '<F5>', "<Cmd>NeoTreeFocusToggle<CR>", { desc = 'Toggle NvimTree' })
  keymap('n', '<F6>', "<Cmd>NeoTreeShow<CR>", { desc = 'Show Neo-tree (non-focused)' })

  require("neo-tree").setup({
    close_if_last_window = true,
    source_selector = {
      winbar = true,
      content_layout = "center",
    },
    default_component_configs = {
      indent = { padding = 0 },
    },
    window = {
      width = 40,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
      },
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      follow_current_file = true,
      use_libuv_file_watcher = true,
    },
  })
end

return M
