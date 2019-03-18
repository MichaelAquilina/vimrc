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
" Enables previewing what is being substituted with %s/
set inccommand=nosplit

call plug#begin('~/.vim/plugged')

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'kana/vim-textobj-entire'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'

Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'arrufat/vala.vim'
Plug 'keith/swift.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Shougo/neosnippet'
Plug 'MichaelAquilina/neosnippet-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
Plug 'challenger-deep-theme/vim'
Plug 'jremmen/vim-ripgrep'

call plug#end()
filetype plugin indent on    " required!

colorscheme challenger_deep

let g:mapleader=' '

" Allow opening github enterprise urls
let g:github_enterprise_urls = ['https://git.lystit.com']

" Shortcuts for editing commonly used configs
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>ez :edit ~/.zshrc<cr>
nnoremap <leader>ei :edit ~/.config/i3/config<cr>
nnoremap <leader>ep :edit ~/.config/polybar/config<cr>

" Quickly move lines up and down
nnoremap - ddp
nnoremap _ ddkP

" NerdTree Shortcuts
nnoremap <leader>/ :NERDTreeToggle<cr>

nnoremap <leader>]  :GitGutterNextHunk<cr>
nnoremap <leader>[  :GitGutterPrevHunk<cr>
nnoremap <leader>+ :GitGutterLineHighlightsToggle<cr>
nnoremap <leader>c :GitGutterUndoHunk<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Uppercasing shortcuts
nnoremap <c-u> veU<esc>
inoremap <c-u> <esc>lveU<esc>i

nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>

" Disable Ex-mode
nnoremap Q <nop>

" Disable stop redraw
nnoremap <c-s> <nop>

" Don't insert odd characters into buffer by mistake
inoremap <c-b> <nop>
inoremap <c-s> <nop>

nnoremap <esc><esc> :let @/ = ""<cr>

nnoremap <c-right> w
nnoremap <c-left> b

" Copy the relative path + row number to the clipboard
function! CopyRelativePath(linenumber)
    if a:linenumber
        echom 'Copied relative path to clipboard (with line number)'
        let @+ = @% . ':' . line('.')
    else
        echom 'Copied relative path to clipboard'
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

" Enable word wrapping in text files
augroup WrapLineInMarkdownFile
    autocmd!
    autocmd FileType markdown setlocal wrap lbr
augroup END

augroup vimrc
    autocmd!

    call neomake#configure#automake('nw')

    " Remove extra whitespaces
    autocmd InsertLeave,BufLeave,FocusLost * silent! :%s/\s\+$//e
    " Remove extra blank lines at the end of the file
    autocmd InsertLeave,BufLeave,FocusLost * silent! :%s#\($\n\s*\)\+\%$##

    " Autoreload on external changes
    autocmd BufEnter,FocusGained * :checktime

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
