local M = {}
local ts = require('nvim-treesitter.configs')

function M.setup()
	ts.setup {
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"gomod",
			"gosum",
			"html",
			"javascript",
			"json",
			"lua",
			"php",
			"python",
			"sql",
			"tsx",
			"typescript",
			"vim",
			"vue",
			"yaml"
		},
		indent = { enable = true },
		highlight = {
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
	}
end

return M
