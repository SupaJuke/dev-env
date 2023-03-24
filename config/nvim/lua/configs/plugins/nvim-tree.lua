local M = {}

local function set_keymaps()
	vim.keymap.set('n', '<F5>', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
	vim.keymap.set('n', '<F6>', '<Cmd>NvimTreeFindFile<CR>', { desc = 'Show current file in NvimTree' })
end

function M.setup()
	require('nvim-tree').setup({
		view = {
			width = 40,
		},
	})
	set_keymaps()
	vim.cmd([[highlight NvimTreeNormal guibg = none]])
end

return M
