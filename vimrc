filetype off
syntax enable
set number
set nocompatible
set laststatus=2
set eol
set mouse=a
set hlsearch
set incsearch
set showmatch
set autoread
set noswapfile
set cursorline
set cursorcolumn
set colorcolumn=100
set nofoldenable
set expandtab
set tabstop=4
set shiftwidth=4
filetype indent on
set nowrap
set autoindent

call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake' | Plug 'dojoteef/neomake-autolint'
let g:neomake_python_enabled_makers = ['flake8']

Plug 'terryma/vim-multiple-cursors'

Plug 'maralla/completor.vim'
let g:completor_python_binary = '/usr/bin/python3.6'

Plug 'scrooloose/nerdtree'
Plug 'arrufat/vala.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Plug 'davidhalter/jedi-vim'
set completeopt=menuone,longest
let g:jedi#show_call_signatures=0
let g:jedi#smart_auto_mappings=0
let g:jedi#completions_enabled=0

Plug 'joshdick/onedark.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'w'

call plug#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

" Custom command shortcuts
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>ez :edit ~/.zshrc<cr>
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>]  :lnext<cr>
nnoremap <leader>[  :lprevious<cr>

" Uppercasing shortcuts
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>lveU<esc>i

" Disable Ex-mode
nnoremap Q <nop>
" Disable stop redraw
nnoremap <c-s> <nop>

" Dont insert odd characters into buffer by mistake
inoremap <c-b> <nop>
inoremap <c-s> <nop>

nnoremap <cr> i<cr>

nnoremap <esc><esc> :let @/ = ""<cr>

nnoremap <leader>e :Errors<cr>

set t_Co=256  " Explicitly tell Vim that the terminal supports 256 colors
set encoding=utf-8

set hidden
set history=100

" Show whitespace characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,
set list

" Remove extra whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Save on Focus Lost. Only supported on neovim with terminals :)
autocmd BufLeave,FocusLost * silent! wall

" ripgrep is much faster. Use it if its available
if executable('rg')
  let g:ackprg = "rg --vimgrep --smart-case"
  set grepprg="rg --vimgrep --smart-case"
  " Use rg in CtrlP for listing files. Lightning fast
  let g:ctrlp_user_command = "rg %s --color=never --files -g ''"
  " ripgrep is fast enough not to need caching
  let g:ctrlp_use_caching = 0
endif

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
