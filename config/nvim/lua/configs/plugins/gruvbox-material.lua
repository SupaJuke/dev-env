local M = {}

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

        let g:gruvbox_material_background = 'hard'
        let g:gruvbox_material_disable_italic_comment = 1
        let g:gruvbox_material_transparent_background = 1
    ]]
  )
end

return M
