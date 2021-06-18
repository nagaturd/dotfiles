set hidden
set number
set nowrap
set scrolloff=8
set colorcolumn=80
set wildmenu
set termguicolors
set updatetime=50
set signcolumn=yes
set noshowmode
" set laststatus=2

" Backup/Swap
set noswapfile
set nowritebackup 
set nobackup

" Encoding
set encoding=utf-8
set termencoding=utf-8

" Searching
set incsearch
set nohlsearch

" Tabs and Indentations
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
syntax enable

let mapleader = " "

" Vim-Plug
" Install vim-plug if not found
if empty(glob("${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share"/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'
call plug#end()

" Apply colorscheme
colorscheme hybrid
" let g:lightline = {
"    \ 'colorscheme': 'Tomorrow_Night'
"    \ }
" highlight Normal guibg=none

