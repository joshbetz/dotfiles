set nocompatible

syntax on

set linespace=0
set showmatch
set incsearch
set relativenumber
set hlsearch
set ignorecase
set smartcase
set scrolljump=5
set scrolloff=3

" Absolute line numbers in insert mode, and relative in normal mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Formatting
set nowrap
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
