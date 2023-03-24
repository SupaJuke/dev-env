M = {}

function M.setup()
	-- vim.cmd([[set background = dark]])
	vim.cmd([[let g:gruvbox_material_background = 'hard']])
	vim.cmd([[let g:gruvbox_material_better_performance = 1]])
	vim.cmd([[colorscheme gruvbox-material]])

	-- NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
	-- NvimTreeRootFolder = { fg = c.blue, style = "bold" },
	-- NvimTreeGitDirty = { fg = c.git.change },
	-- NvimTreeGitNew = { fg = c.git.add },
	-- NvimTreeGitDeleted = { fg = c.git.delete },
	-- NvimTreeSpecialFile = { fg = c.purple, style = "underline" },
	-- LspDiagnosticsError = { fg = c.error },
	-- LspDiagnosticsWarning = { fg = c.warning },
	-- LspDiagnosticsInformation = { fg = c.info },
	-- LspDiagnosticsHint = { fg = c.hint },
	-- NvimTreeIndentMarker = { fg = c.fg_gutter },
	-- NvimTreeImageFile = { fg = c.fg_sidebar },
	-- NvimTreeSymlink = { fg = c.blue },
end

return M
