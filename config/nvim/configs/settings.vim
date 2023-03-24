" ========== Cursor Settings ========== "

set guicursor=n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
			\,sm:block-blinkwait175-blinkoff150-blinkon175

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

" Change PWD
autocmd BufEnter * silent! lcd %:p:h
au VimLeave * set guicursor=a:ver25-blinkon175
