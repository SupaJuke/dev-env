" ========== Indentation Settings ========== "

" Default Settings
set expandtab
set tabstop=2
set shiftwidth=2
"  set autoindent
"  set smartindent
"  set smarttab
set shiftround
"  set preserveindent

" Dectecting filetype & indentation of the file
filetype plugin indent on

" ========== Cursor Settings ========== "

set guicursor=n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
			\,sm:block-blinkwait175-blinkoff150-blinkon175

" Return cursor once leave -> only for windows
" au VimLeave * set guicursor=a:ver25-blinkon175

" ========== Other Settings ========== "

" Enable syntax highlighting
syntax enable

" If text goes beyond terminal
set wrap

" Show smth
set showmode showcmd

" Line number
set number ruler

" Matching bracket
set showmatch

" Maintain terminal (instead of terminating)
set hidden

" Split right
set splitright

" Backspace
set backspace=indent,eol,start

" Mouse movement
set mouse=a

" Case insensitive search
set ignorecase smartcase

" Highlight current line
set cursorline
set hlsearch
set shortmess-=S

" Change PWD
autocmd BufEnter * silent! lcd %:p:h

" Yanking
set clipboard+=unnamedplus
let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }

" === Plugins === "
call plug#begin()

Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

call plug#end()

if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1

colorscheme gruvbox-material
