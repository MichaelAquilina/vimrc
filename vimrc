filetype off
syntax enable
set number
set nocompatible
set laststatus=2
set mouse=a
set hlsearch
set incsearch
set showmatch
set autoread
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"
Bundle "mileszs/ack.vim"

Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
let g:airline_powerline_fonts = 1

Bundle "davidhalter/jedi-vim"
Bundle "tomasr/molokai"
Bundle "joshdick/onedark.vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle "ervandew/supertab"

call vundle#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

" Custom command shortcuts
map <leader>s :source ~/.vimrc<CR>
nnoremap - ddp
nnoremap _ ddkP

" Uppercasing shortcuts
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>lveU<esc>i

set t_Co=256  " Explicitly tell Vim that the terminal supports 256 colors
set encoding=utf-8

set hidden
set history=100

filetype indent on
set nowrap
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set listchars=tab:>-

"Remove extra whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

set wildignore+=*.py[co],*/\.git/*

" ripgrep is much faster. Use it if its available
if executable('rg')
  let g:ackprg = "rg --vimgrep --no-heading --smart-case"
  set grepprg="rg --vimgrep --no-heading --smart-case"
  " Use rg in CtrlP for listing files. Lightning fast
  let g:ctrlp_user_command = "rg %s -g --vimgrep --files --smart-case"
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
