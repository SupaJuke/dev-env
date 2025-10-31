local M = {}
local keymap = vim.keymap.set

function M.setup()
  -- keymap('n', '<Home>', "0")
  keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
  keymap('n', '<Esc>', ":noh<CR>", { noremap = true })

  -- moving up/down the page
  keymap("n", "<C-d>", "<C-d>zz")
  keymap("n", "<C-u>", "<C-u>zz")
  keymap("n", "<C-f>", "<C-f>zz")
  keymap("n", "<C-b>", "<C-b>zz")
end

return M
