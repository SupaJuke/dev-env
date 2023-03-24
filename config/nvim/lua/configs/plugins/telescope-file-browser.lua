local M = {}

function M.setup()
	vim.api.nvim_set_keymap(
		"n",
		"<space>fb",
		":Telescope file_browser",
		{ noremap = true }
	)

	-- open file_browser with the path of the current buffer
	vim.api.nvim_set_keymap(
		"n",
		"<space>fb",
		":Telescope file_browser path=%:p:h select_buffer=true",
		{ noremap = true }
	)
end

return M
