local M = {}

function M.setup()
  vim.cmd(
    [[
        function! s:everforest_custom() abort
            highlight! link NvimTreeNormal Normal
            highlight! link NvimTreeEndofBuffer EndOfBuffer
            highlight! link NvimTreeCursorLine CursorLine
            highlight! link NvimTreeCursorLineNr CursorLineNr
            highlight! link NvimTreeLineNr LineNr
            highlight! link NvimTreeWinSeparator WinSeparator
            highlight! link NvimTreeCursorColumn CursorColumn
        endfunction

        augroup EverforestCustom
            autocmd!
            autocmd ColorScheme everforest call s:everforest_custom()
        augroup END

        let g:everforest_background = 'hard'
        let g:everforest_disable_italic_comment = 1
    ]]
  )
end

return M
