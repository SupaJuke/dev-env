local M = {}
local telescope = require("telescope")
function M.setup()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope find buffers" })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help" })
  vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Telescope find recent" })

  -- Setup
  telescope.setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      file_browser = {
        hijack_netrw = false,
      }
    }
  }

  telescope.load_extension('fzf')
  telescope.load_extension('file_browser')
end

return M
