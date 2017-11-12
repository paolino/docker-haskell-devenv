set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kien/ctrlp.vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'dhruvasagar/vim-buffer-history'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'itchyny/vim-haskell-indent'
Plugin 'endel/vim-github-colorscheme'
Plugin 'jacoborus/tender.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'google/vim-colorscheme-primary'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'xolox/vim-misc'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'

" more Plugin commands
" ...
call vundle#end()            " required
