local M = {}

function M.setup()
  local keyset = vim.keymap.set
  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  -- Accepting Suggestions
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  -- Diagnostic & Definition Navigation
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
  keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, desc = "go to definition" })
  keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
  keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
  keyset("n", "gr", "<Plug>(coc-references)", { silent = true, desc = "see references" })

  vim.g['coc_global_extensions'] = {
    -- "coc-tabnine",  -- cpu & ram usage too high
    "coc-sh",
    "coc-clangd",
    "coc-docker",
    "coc-go",
    "coc-html",
    "coc-tsserver",
    "coc-json",
    "coc-lua",
    -- "@yaegassy/coc-intelephense",
    "coc-pyright",
    "coc-sql",
    "coc-vimlsp",
    -- "coc-vetur",
    "coc-yaml",
    "coc-prettier",
  }
end

return M
