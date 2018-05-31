set encoding=utf-8
scriptencoding utf-8
filetype off
syntax enable
set number
set laststatus=2
set endofline
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
set termguicolors
filetype indent on
set nowrap
set autoindent
set spell spelllang=en_gb

call plug#begin('~/.vim/plugged')

Plug 'neomake/neomake'
let g:neomake_python_enabled_makers = ['flake8', 'python', 'mypy']

Plug 'scrooloose/nerdcommenter'

Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ambv/black'

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
Plug 'flowtype/vim-flow'

Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdtree'
Plug 'arrufat/vala.vim'
Plug 'keith/swift.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'Chiel92/vim-autoformat'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<tab>'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
let g:jedi#show_call_signatures=0
let g:jedi#show_documentation=0
let g:jedi#smart_auto_mappings=0
let g:jedi#completions_enabled=0

Plug 'joshdick/onedark.vim'
Plug 'challenger-deep-theme/vim'

call plug#end()
filetype plugin indent on    " required!

colorscheme challenger_deep

let g:mapleader=' '

" Custom command shortcuts
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>ez :edit ~/.zshrc<cr>
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>]  :lnext<cr>
nnoremap <leader>[  :lprevious<cr>
nnoremap <leader>/ :NERDTreeToggle<cr>
vnoremap <leader>c "+y

" Uppercasing shortcuts
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>lveU<esc>i

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

" Disable Ex-mode
nnoremap Q <nop>
" Disable stop redraw
nnoremap <c-s> <nop>

" Dont insert odd characters into buffer by mistake
inoremap <c-b> <nop>
inoremap <c-s> <nop>

nnoremap <cr> i<cr>

nnoremap <esc><esc> :let @/ = ""<cr>

nnoremap <c-right> w
nnoremap <c-left> b

" Copy the relative path + row number to the clipboard
function! CopyRelativePath(linenumber)
    echom 'Copied relative path to clipboard'
    if a:linenumber
        let @+ = @% . ':' . line('.')
    else
        let @+ = @%
    endif
endfunction

nnoremap <leader>, :call CopyRelativePath(0) <cr>
nnoremap <leader>. :call CopyRelativePath(1) <cr>
vnoremap <leader>fb :Gbrowse <cr>
nnoremap <leader>fb v:Gbrowse <cr>
nnoremap <leader>fd :Gdiff <cr>

set t_Co=256  " Explicitly tell Vim that the terminal supports 256 colors

set hidden
set history=100

" Show whitespace characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<,
set list

augroup vimrc
    autocmd!

    call neomake#configure#automake('nw')

    " Remove extra whitespaces
    autocmd InsertLeave,BufLeave,FocusLost * silent! :%s/\s\+$//e
    " Remove extra blank lines at the end of the file
    autocmd InsertLeave,BufLeave,FocusLost * silent! :%s#\($\n\s*\)\+\%$##

    " Always return to Normal mode when losing Focus
    autocmd FocusLost * stopinsert | wall!

    " Save on Focus Lost
    autocmd BufLeave,FocusLost * silent! wall
augroup END

" ripgrep is much faster. Use it if it's available
if executable('rg')
    let g:ackprg = 'rg --smart-case'
    let g:ctrlsf_ackprg = 'rg'
endif

if &term =~# '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif
