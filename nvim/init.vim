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
set laststatus=2

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

" Tabs and Inndentations
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

filetype plugin indent on
syntax enable

let mapleader = " "

" Vim-Plug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0ng/vim-hybrid'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'herringtondarkholme/yats'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme hybrid
let g:lightline = {
    \ 'colorscheme': 'Tomorrow_Night'
    \ }
highlight Normal guibg=none

" NERDTree
autocmd BufEnter * if tabpagenr('$') == 1
    \ && winnr('$') == 1
    \ && exists('b:NERDTree')
    \ && b:NERDTree.isTabTree()
    \ | quit | endif
autocmd BufWinEnter * silent NERDTreeMirror
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CoC
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
