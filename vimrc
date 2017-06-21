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
set cursorline
set cursorcolumn
set colorcolumn=100

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

Bundle "907th/vim-auto-save"
let g:auto_save = 1
let g:auto_save_events = ["CursorHoldI", "CursorHold", "InsertLeave"]

Bundle "airblade/vim-gitgutter"
Bundle "tpope/vim-fugitive"

Bundle "vim-airline/vim-airline"
Bundle "vim-airline/vim-airline-themes"
let g:airline_powerline_fonts = 1

Bundle "davidhalter/jedi-vim"
set completeopt=menuone,longest
let g:jedi#show_call_signatures=0
let g:jedi#smart_auto_mappings=0
let g:jedi#completions_enabled=0

Bundle "joshdick/onedark.vim"
Bundle "ctrlpvim/ctrlp.vim"
let g:ctrl_working_path_mode = 'w'

Bundle "ervandew/supertab"
Bundle "vim-syntastic/syntastic"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

call vundle#end()
filetype plugin indent on    " required!

colorscheme onedark

let mapleader=" "

" Custom command shortcuts
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>]  :lnext<cr>
nnoremap <leader>[  :lprevious<cr>

" Uppercasing shortcuts
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>lveU<esc>i

nnoremap <leader>e :Errors<cr>

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

" Show whitespace characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,space:.
set list

" Remove extra whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

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
