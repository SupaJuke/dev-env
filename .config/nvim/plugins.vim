" ========== Plugins ========== "

call plug#begin()

" Theme
Plug 'sainnhe/gruvbox-material'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" File Explorer
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdtree'

" Bufferline (visual)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Git Decoration
Plug 'lewis6991/gitsigns.nvim'

" Fugitive
Plug 'tpope/vim-fugitive'

" Startify
Plug 'mhinz/vim-startify'

" Icons (PUT THIS LAST)
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()


" ========== NERDTree Settings ========== "

" Launching Startify & NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * 
            \   if argc() == 0 && !exists('s:std_in')
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | elseif argc() == 0 && exists('s:std_in')
            \ | elseif argc() > 0 || exists('s:std_in')
            \ |   NERDTree
            \ |   wincmd p
            \ | endif

" Close tab if last window = NERDTree
autocmd BufEnter * 
            \ if winnr('$') == 1
            \ && exists('b:NERDTree')
            \ && b:NERDTree.isTabTree()
            \ | set guicursor=a:ver25-blinkon0
            \ | quit | endif

" Map F5 to open NERDTree
map <F5> :NERDTreeToggle<CR>

" ========== Startify Settings ========== "

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_padding_left = 3

let g:startify_bookmarks = [
    \ { 'z': '~/.zshrc'},
    \ { 'v': '~/.config/nvim'},
    \ ]

let g:startify_lists = [
    \ { 'header': ['   Bookmarks'], 'type': 'bookmarks'},
    \ { 'header': ['   Most Recently Opened'], 'type': 'files'},
    \ { 'header': ['   Last Directory: '.getcwd()], 'type': 'dir'},
    \ ]

let g:startify_custom_header = [
    \'                                              ',
    \'        ######  ##     ## ########     ###    ',
    \'       ##    ## ##     ## ##     ##   ## ##   ',
    \'       ##       ##     ## ##     ##  ##   ##  ',
    \'        ######  ##     ## ########  ##     ## ',
    \'             ## ##     ## ##        ######### ',
    \'       ##    ## ##     ## ##        ##     ## ',
    \'        ######   #######  ##        ##     ## ',
    \'                                              ',
    \ ]

let g:startify_custom_footer = [
    \ '   |-----------------------------------------------------------------------------|',
    \ '   | "To live is to suffer, to survive is to find some meaning in the suffering" |',
    \ '   | ---- Fredrich Neitzsche                                                     |',
    \ '   |-----------------------------------------------------------------------------|',
    \ ]
