filetype off
syntax enable
set number
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "airblade/vim-gitgutter"
Bundle "vim-airline/vim-airline"
Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "joshdick/onedark.vim"
Bundle "ctrlpvim/ctrlp.vim"

call vundle#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

map <leader>s :source ~/.vimrc<CR>

set t_Co=256  " Explicitly tell Vim that the terminal supports 256 colors
set encoding=utf-8

set hidden
set history=100

filetype indent on
set nowrap
set smartindent
set autoindent
set tabstop=2
set shiftwidth=4

"Remove extra whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

"Enable highlighting of search results
set hlsearch
"Highlight matching parenthesis
set showmatch

" Enable mouse support
set mouse=a

set wildignore+=*.py[co]
