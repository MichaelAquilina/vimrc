filetype off
syntax enable
set number

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "joshdick/onedark.vim"
Bundle "ctrlpvim/ctrlp.vim"

call vundle#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

map <leader>s :source ~/.vimrc<CR>

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
