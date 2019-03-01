" Syntax Highlighing
if has("syntax")
	syntax on
endif

" Setting Base
set nu
set hlsearch
set scrolloff=2
set autoindent
set cindent
set ts=4 " Tab width
set shiftwidth=4 "width for autoindent
set paste
set showmatch
set ruler

map <C-C> :s:^:#<CR>
map <C-T> :s:^#<CR>
