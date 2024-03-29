local M = {}

local keymap = vim.keymap.set

function M.setup()
  -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  vim.g.neo_tree_remove_legacy_commands = 1
  keymap('n', '<F5>', "<Cmd>Neotree focus left toggle<CR>", { desc = 'Toggle Neotree' })
  keymap('n', '<F6>', "<Cmd>Neotree show<CR>", { desc = 'Show Neotree (non-focused)' })

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
      follow_current_file_enabled = true,
      use_libuv_file_watcher = true,
    },
  })
end

return M
