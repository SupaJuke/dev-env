" ====================== DEPRECATED ====================== "
" ========= PLEASE READ lua/plugins.lua INSTEAD ========== "
" ======================================================== "

" ========== Indentation Settings ========== "

" Default Settings
set expandtab
set tabstop=4
set shiftwidth=4
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

" Change PWD
autocmd BufEnter * silent! lcd %:p:h

" Yanking
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

" ========== Plugins ========== "

call plug#begin()

" Theme
Plug 'sainnhe/gruvbox-material'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" File Explorer
Plug 'preservim/nerdtree'
"  Plug 'kyazdani42/nvim-tree.lua'

" Bufferline (visual)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Git Decoration
Plug 'lewis6991/gitsigns.nvim'

" Startify
Plug 'mhinz/vim-startify'

" Devicon
Plug 'ryanoasis/vim-devicons'

" WebDevicon
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" ========== NERDTree Settings ========== "

"  Launching Startify & NERDTree
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

"  Close tab if last window = NERDTree
autocmd BufEnter * 
            \ if winnr('$') == 1
            \ && exists('b:NERDTree')
            \ && b:NERDTree.isTabTree()
            \ | set guicursor=a:ver25-blinkon0
            \ | quit | endif

"  Map F5 to open NERDTree
map <F5> :NERDTreeToggle<CR>

" NERDTree always shows hidden files
let NERDTreeShowHidden=0

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
    \'                                 ╒                               ',
    \'                    ,╓µµ,         ▓╕                             ',
    \'                 ,P`      ,▀g    ,▓▐█▌,,                         ',
    \'                ▄     ,▄▄░▄&▐▒░░▒▒▒▒▒▒░░░░░░▒N╖   ,∞═**═∞,       ',
    \'                ▌   ▄▓▒▓▀░▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒░▀▓▒.      \"W    ',
    \'                ▌  .▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒░▀⌂,      ╚⌐   ',
    \'                ▐ ░▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▐▌▀▄     ▓   ',
    \'                 ╙▓░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▐▌▒▌    ▓   ',
    \'           \     ▐░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▐▓░░░░,▌   ',
    \'         ,▄╗,    ▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▌▌▀░▄░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀w░░▄▀    ',
    \'    \`~   ▌░░⌠▀⌠F ▓▒▒▒▒▒▒▒▒▒▒▒▒░╝▐▀  ▄▓▌▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓╜      ',
    \'       ` ╙▀░░░░▐ ╘W▒▒▒▒▒▒▒▒░Å╜         ▀^▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒⌐       ',
    \'          ▀╩╩æ╩   ▀░▒▒░▄P╩▀▄               ▀▄▒▒▒▒░▒▒▒▒▒▒▒U       ',
    \'                   ▀▄▓▒` ╧   ╦        └▄ ` ╙╙▀▄░▒▒▒▒▒▒▒▒▐        ',
    \'          ╓▄        ▐`  ██⌐  ▐       ▀▀    ⁿ∞  ▀▀▌▒▒▒▒▒▒▌  ╓╦B▓  ',
    \'       ▐░▐░░▀┐      ╙J       ▀       ▓   ▐██⌐   M\"█╩▄▒░▀ \"▀▓▄▓▓',
    \'        ▐▌╔φ▐    Æ&. ▓¥,,,,Æ`        ▐         Æ  ▌▌ Ü` ,Æ▐▓▓▓`  ',
    \'         ▀∞     \"╚╩` ▐       ▐µ    ▄▄  ⁿ∞w,╓w∞╜     ▐▄Æ▓M╙▐▀    ',
    \'   Tg                 ╙╦       ╓▀▒▀▒▐U          ▄███▓█▀          ',
    \'   ░░▒        ,φ$Z` `""%IM-,     ╙╩╩▀        ,▄▀▀▄ë▀█▓,          ',
    \'   ▄░U    ^   ▌═▓██     ``─░`└░TTMMMMm∞∞╤MMT▀▀ⁿ╨▀*╧Å▄█▓█▌═       ',
    \'               ▀Ñ,                  ``````             ▀▀▄▄,     ',
    \'        ╔░ ▄       ⁿ∞,      ▄▄▄▄╕ ▄▄▄▄▄▄          ▓▄▄▄▄▄▄▄▀`     ',
    \'        \"\"\"`          ▓░    ,▄▄█▄   ▄█\"       ▄\ⁿ\"  ▀▀▀▀    ',
    \'                     ╔          ▀  ▀          ▀                  ',
    \'                                              ¬                  ',
    \ ]

let g:startify_custom_footer = [
    \ '   +-----------------------------------------------------------------------------+',
    \ '   | "To live is to suffer, to survive is to find some meaning in the suffering" |',
    \ '   | ---- Fredrich Neitzsche                                                     |',
    \ '   +-----------------------------------------------------------------------------+',
    \ ]
