filetype on
syntax enable
set number

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "tomasr/molokai"
Bundle "L9"
Bundle "FuzzyFinder"

call vundle#end()
filetype plugin indent on    " required!

colorscheme molokai

let mapleader=" "

map <leader>s :source ~/.vimrc<CR>
map <leader>p :FufCoverageFile|

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
