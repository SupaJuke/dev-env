local M = {}

function M.setup()
  -- open file_browser with the path of the current buffer
  vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true <CR>",
  { noremap = true, desc = "Telescope file explorer" })
end

return M
