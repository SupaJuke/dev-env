local M = {}

function M.setup()
	local keyset = vim.keymap.set
	local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
	keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

	vim.g['coc_global_extensions'] = {
		"coc-tabnine",
		"coc-sh",
		-- "coc-clangd",
		"coc-docker",
		-- "coc-go",
		-- "coc-html",
		-- "coc-tsserver",
		"coc-json",
		"coc-lua",
		-- "@yaegassy/coc-intelephense",
		-- "coc-pyright",
		"coc-sql",
		"coc-vimlsp",
		"coc-vetur",
		"coc-yaml",
	}
end

return M