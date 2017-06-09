filetype off
syntax enable
set number
set nocompatible
set laststatus=2
set mouse=a
set hlsearch
set showmatch

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"

Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
let g:airline_powerline_fonts = 1

Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "joshdick/onedark.vim"
Bundle "ctrlpvim/ctrlp.vim"

call vundle#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

" Custom command shortcuts
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

set wildignore+=*.py[co]

