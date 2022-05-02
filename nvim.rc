" ===== Plugin ===== "

call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'

call plug#end()


" ===== Colorscheme ===== "

if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material


" ===== NERDTree Settings ===== "

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


" ===== Airline Settings ===== "

" Enable powerline fonts
let g:airline_powerline_fonts = 1


" ===== Cursor ===== "

" Set cursor to block and blinking
set gcr=n-v:block-nCursor,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon17" Other


" ===== Others ===== "

filetype plugin indent on

syntax enable

" Text wrap
set wrap

" Indentation (tab)
set tabstop=4
set shiftwidth=4

set expandtab
set shiftround
set preserveindent
set autoindent
set smartindent

" Backspace
set backspace=indent,eol,start

" Smth
set showmode showcmd

" Line number
set number ruler

" Bracket
set showmatch

" Mouse movement
set mouse=a

" Case insensitive search
set ignorecase smartcase

" Split right
set splitright

" Change PWD
autocmd BufEnter * silent! lcd %:p:h
