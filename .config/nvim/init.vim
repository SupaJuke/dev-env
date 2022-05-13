runtime ./plugins.vim
runtime ./interface.vim
runtime ./indentation.vim

" ========== Lua Settings ========== "

luafile ~/.config/nvim/lua/init.lua

" ========== Theme Settings ========== "

if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
