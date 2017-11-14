
filetype plugin indent on    " required

syntax on

set nocompatible
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildmenu
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set t_Co=256
set cmdheight=1
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set autowriteall
set colorcolumn=80
set number relativenumber
set foldmethod=indent

map <Leader>s :SyntasticToggleMode<CR>
set laststatus=2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
map <Leader>n :NERDTreeToggle<CR>
let g:haskell_tabular = 1


map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

nnoremap <F8> :BufferHistoryList<CR>:b 
nnoremap <F9> :BufferHistoryBack<CR>
nnoremap <F10> :BufferHistoryForward<CR>


let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[2 q"

map <c-h> :!hasktags .<cr><cr>
let mapleader = ","
colorscheme wasabi256
