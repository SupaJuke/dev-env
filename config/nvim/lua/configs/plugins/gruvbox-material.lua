M = {}

function M.setup()
	vim.cmd(
		[[
			function! s:gruvbox_material_custom() abort
				highlight! link NvimTreeNormal Normal
				highlight! link NvimTreeEndofBuffer EndOfBuffer
				highlight! link NvimTreeCursorLine CursorLine
				highlight! link NvimTreeCursorLineNr CursorLineNr
				highlight! link NvimTreeLineNr LineNr
				highlight! link NvimTreeWinSeparator WinSeparator
				highlight! link NvimTreeCursorColumn CursorColumn
			endfunction
			
			augroup GruvboxMaterialCustom
				autocmd!
				autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
			augroup END
		]]
	)
	vim.cmd([[set background=dark]])
	vim.cmd([[let g:gruvbox_material_background = 'hard']])
	vim.cmd([[colorscheme gruvbox-material]])
end

return M
