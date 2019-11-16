# http://seohakim.blogspot.com/2015/02/mac-vim.html
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# set nocompatible 
# filetype off 
# set rtp+=~/.vim/bundle/Vundle.vim 
# call vundle#begin() 
# Plugin 'gmarik/Vundle.vim' "required
# Plugin 'tpope/vim-fugitive' "required 
# call vundle#end()            
# filetype plugin indent on " Put your non-Plugin stuff after this line
# :w
# :source %
# :PluginInstall


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
