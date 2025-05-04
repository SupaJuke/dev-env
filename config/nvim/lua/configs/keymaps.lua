local M = {}
local keymap = vim.keymap.set

function M.setup()
  -- keymap('n', '<Home>', "0")
  keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
  keymap('n', '<Esc>', ":noh<CR>", { noremap = true })
end

return M
