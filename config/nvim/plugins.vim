" ====================== DEPRECATED ====================== "
" ========= PLEASE READ lua/plugins.lua INSTEAD ========== "



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

" ========== NvimTree Settings ========== "

" Launching Startify & NERDTree
"  autocmd StdinReadPre * let s:std_in=1
"  autocmd VimEnter * 
"              \   if argc() == 0 && !exists('s:std_in')
"              \ |   Startify
"              \ |   NvimTreeFocus
"              \ |   wincmd w
"              \ | elseif argc() == 0 && exists('s:std_in')
"              \ | elseif argc() > 0 || exists('s:std_in')
"              \ |   NvimTreeFocus
"              \ |   wincmd p
"              \ | endif

" Close tab if last window = NERDTree
"  autocmd BufEnter * 
"              \ if winnr('$') == 1
"              \ && exists('b:NvimTree')
"              \ && b:NvimTree.isTabTree()
"              \ | set guicursor=a:ver25-blinkon0
"              \ | quit | endif

" Map F5 to open NvimTree
" map <F5> :NvimTreeToggle<CR>

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
