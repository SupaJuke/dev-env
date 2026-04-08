local M = {}

function M.setup()
  vim.g.mkdp_filetypes = { "markdown" }
  vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
end

return M
